using UnityEngine;
using System.Collections;
using System.Collections.Generic;

[ExecuteInEditMode]
public class DrawNormal : MonoBehaviour {

    public bool showNormal = true;

    [Range(0.1F, 10F)]
    public float length = 0.2F;

    [Range(0F, 0.1F)]
    public float sphereSize = 0.01F;
  
    const int showVertexThreshold = 1000;

    [HideInInspector]
    public bool isReachMaxVertexCount = false;

    const float DrawInterval = 1F;
    float curTime = 0F;

    

    Mesh GetMesh () {
        var meshF = GetComponent<MeshFilter>();
        if (meshF == null)
        {
            var skinnedMesh = GetComponent<SkinnedMeshRenderer>();
            if (skinnedMesh == null)         
                return null;

            return skinnedMesh.sharedMesh;
        }
			
        return meshF.sharedMesh;
    }

    void OnDrawGizmosSelected()
    {
        if (!showNormal)
            return;

        if (curTime < DrawInterval)
            curTime += Time.deltaTime;

        curTime = 0F;

        var mesh = GetMesh();
        if (mesh == null)
            return;

        isReachMaxVertexCount = mesh.vertexCount > showVertexThreshold;

        int vertexCount = Mathf.Clamp(mesh.vertexCount, 0, showVertexThreshold);
        for (var i = 0; i < vertexCount; ++i)
        {
            var origin = transform.TransformPoint(mesh.vertices[i]);
            Gizmos.DrawSphere(origin, sphereSize);
            Gizmos.DrawRay(origin, transform.TransformDirection(mesh.normals[i]) * length);
        }
    }
    
}
