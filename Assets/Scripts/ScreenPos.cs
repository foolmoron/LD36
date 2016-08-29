using UnityEngine;
using System.Collections;

public static class ScreenPos {
    
    public static Vector2 FromTransform(Transform transform, Camera camera) {
        var screen = camera.WorldToScreenPoint(transform.position).to2();
        var y = screen.y / Screen.height;
        var x = screen.x / Screen.width;
        if (y < 0.1f) { y = 0; x = 0; } else { y = (y - 0.1f) / 0.9f; }
        return new Vector2(x, y);
    }
}
