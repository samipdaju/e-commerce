import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:im_stepper/stepper.dart';
import 'package:nayakoseli/model/categories.dart';
import 'package:nayakoseli/model/trackordericonmodel.dart';
import 'package:nayakoseli/model/trackordermodel.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 8, 15),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                itemBuilder: (context, position) {
                  List orderList = List.from(orderedList.reversed);
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: orderList[position].visible
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))
                                : BorderRadius.circular(30),
                            color: Colors.white),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              orderList[position].visible =
                                  !orderList[position].visible;
                            });
                          },
                          trailing: Icon(Icons.arrow_drop_down),
                          title: Text(
                            orderList[position].name,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            orderList[position].orderId,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: orderList[position].visible,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width / 6,
                                child: IconStepper(
                                  enableNextPreviousButtons: false,
                                  activeStepBorderColor: Colors.transparent,
                                  activeStepBorderPadding: 0,
                                  enableStepTapping: false,
                                  activeStepColor: Colors.green,
                                  stepColor: Colors.green,
                                  stepRadius: 16,
                                  icons: [
                                    Icon(Icons.check),
                                    orderList[position].isShipped
                                        ? Icon(Icons.check)
                                        : Icon(Icons.circle),
                                    orderList[position].isPicked
                                        ? Icon(Icons.check)
                                        : Icon(Icons.circle),
                                    orderList[position].isDelivered
                                        ? Icon(Icons.check)
                                        : Icon(Icons.circle),
                                  ],
                                  direction: Axis.vertical,
                                  lineLength: 73,
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconTracker(
                                          leading: Icons.store,
                                          title: "Order Placed",
                                          subtitle:
                                              "Your order has been placed."),
                                      IconTracker(
                                          leading: Icons.local_shipping,
                                          title: orderList[position].isShipped
                                              ? "Order Shipped"
                                              : "Ready to Ship",
                                          subtitle: orderList[position]
                                                  .isShipped
                                              ? "Your Order has been Shipped"
                                              : "Your order has not been shipped yet"),
                                      IconTracker(
                                          leading: Icons.motorcycle,
                                          title: orderList[position].isPicked
                                              ? "Order Picked by delivery guy"
                                              : "Yet to be picked",
                                          subtitle: orderList[position].isPicked
                                              ? "Delivery guy has taken your order. Expect soon!"
                                              : "Your order has not been picked yet"),
                                      IconTracker(
                                          leading: Icons.home,
                                          title: orderList[position].isDelivered
                                              ? "Order Delivered"
                                              : "Yet to be delivered",
                                          subtitle: orderList[position]
                                                  .isDelivered
                                              ? "Your order has been successfully delivered. Make sure to leave reviews"
                                              : "Your order is not yet delivered. Keep Patience."),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemCount: orderedList.length,
              ),
            ),
          ],
        ));
  }
}

class IconTracker extends StatelessWidget {
  late IconData leading;
  late String title;
  late String subtitle;

  IconTracker(
      {required this.leading, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              leading,
              color: Colors.black,
              size: 40,
            ),
            subtitle: Text(subtitle),
            title: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
