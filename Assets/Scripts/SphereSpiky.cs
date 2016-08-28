using UnityEngine;
using System.Collections;

public class SphereSpiky : MonoBehaviour {

    [Range(0, 10)]
    public float Amplitude;
    
    Renderer childRenderer;

    void Start() {
        childRenderer = transform.FindChild("Spikes").GetComponent<Renderer>();
    }
    
    void Update() {
        childRenderer.material.SetFloat("_Amplitude", Amplitude);
        childRenderer.material.SetFloat("_Phase", Mathf.Abs(Mathf.Sin(Time.timeSinceLevelLoad * 4)));
    }
}
