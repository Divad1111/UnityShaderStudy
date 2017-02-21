using UnityEngine;
using System.Collections;
using UnityEditor;

[CustomEditor(typeof(DrawNormal))]
public class DrawNormalEditor : Editor
{


    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();

        var tar = target as DrawNormal;

        if (tar == null)
            return;

        if (tar.isReachMaxVertexCount)
            EditorGUILayout.HelpBox("Vertex number too much! Don't show all.", MessageType.Warning);
    }
}
