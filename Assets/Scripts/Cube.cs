using UnityEngine;
using System.Collections;

public class Cube : MonoBehaviour {
    
    HueRotate hueRotate;
    Renderer thisRenderer;

    void Start() {
        hueRotate = GetComponent<HueRotate>();
        thisRenderer = GetComponent<Renderer>();
    }
    
    void Update() {
        thisRenderer.material.SetColor("_Color", hueRotate.Color);
    }
}
