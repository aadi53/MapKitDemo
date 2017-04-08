//
//  ViewController.swift
//  MapViewDemo
//
//  Created by Administrator on 07/04/17.
//  Copyright © 2017 Zerones. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotation : NSObject , MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    var title: String?
    var subtitle: String?
    
}

class AnnotationView : MKAnnotationView {
    var titleLable : UILabel!
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        titleLable = UILabel(frame: self.bounds)
        titleLable.backgroundColor = UIColor.lightGray
        titleLable.textAlignment = .center
        self.addSubview(titleLable)
        
        titleLable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var MyMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let annotation = MapAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 23.70, longitude: 70.20)
        annotation.title = "First Annotation"
        annotation.subtitle = "First Annotation Subtitle First Annotation Subtitle First Annotation Subtitle"
        
        MyMapView.addAnnotation(annotation)
        
        MyMapView.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        print("annotation ==>> \(annotation)")
        if annotation.isKind(of: MKUserLocation.self){
            print("User Location Pin")
            
            if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "UserLocation")
            {
                return annotationView
            }
            
            let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "UserLocation")
            annotationView.pinTintColor = UIColor.blue
            
            return annotationView

        }
        
        //if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "MapAnnotation")
        //{
        //    return annotationView
        //}
        //
        //let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "MapAnnotation")
        //annotationView.pinTintColor = UIColor.purple
        //
        //return annotationView
        
        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "MapAnnotationView")
        {
            return annotationView
        }
        
        let annotationView : AnnotationView = AnnotationView(annotation: annotation, reuseIdentifier: "MapAnnotationView")
        annotationView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 80))
        annotationView.titleLable.text = annotation.title!
        
        return annotationView

        
    }
    
    
    
    
    

}

