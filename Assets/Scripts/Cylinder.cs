using UnityEngine;
using System.Collections;
using UnityStandardAssets.ImageEffects;

public class Cylinder : MonoBehaviour {

    MotionBlur motion;
    
    void Start() {
        motion = Camera.main.GetComponent<MotionBlur>();
    }
    
    void Update() {
        var s = ScreenPos.FromTransform(transform, Camera.main);
        Time.timeScale = s.x == 0 ? 1 : Mathf.Lerp(0, 2, s.x * s.x);
        motion.blurAmount = Mathf.Sqrt(s.y);
    }
}
