using UnityEngine;
using System.Collections;

public class HueRotate : MonoBehaviour {

    public Color Color = Color.white;
    float h, s, v;
    public float Speed = 0.2f;

    Renderer thisRenderer;
    Renderer childRenderer;

    void Start() {
        thisRenderer = GetComponent<Renderer>();
        childRenderer = transform.childCount > 0 ? transform.GetChild(0).GetComponent<Renderer>() : null;
    }

    void Update() {
        Color.RGBToHSV(Color, out h, out s, out v);
        h = (h + Time.deltaTime / 3) % 1;
        Color = Color.HSVToRGB(h, s, v);
        thisRenderer.material.SetColor("_Color", Color);
        if (childRenderer) {
            childRenderer.material.SetColor("_Color", Color);
        }
    }
}
