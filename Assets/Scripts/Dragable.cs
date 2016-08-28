using UnityEngine;
using System.Collections;

public class Dragable : MonoBehaviour {

    bool dragging;
    Vector2 originalPosition;
    
    void Update() {
        var mousePos = Input.mousePosition;
        mousePos.x = Mathf.Clamp(mousePos.x, 0, Screen.width);
        mousePos.y = Mathf.Clamp(mousePos.y, 0, Screen.height);
        var screenPoint = Camera.main.ScreenToWorldPoint(mousePos).to2();
        if (Input.GetMouseButtonDown(0)) {
            RaycastHit hit;
            if (Physics.Raycast(screenPoint.to3(-10), Vector3.forward, out hit)) {
                if (hit.collider.gameObject == gameObject) {
                    dragging = true;
                    originalPosition = screenPoint;
                }
            }
        } else if (Input.GetMouseButtonUp(0)) {
            dragging = false;
        }
        if (dragging) {
            var newPos = Camera.main.ScreenToWorldPoint(mousePos).withZ(transform.position.z);
            transform.position = newPos;
        }
    }
}
