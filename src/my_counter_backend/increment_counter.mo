import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

actor Counter {
  // 定义stable
  stable var currentValue : Nat = 0;


public type HeaderField = (Text, Text);

  public type HttpRequest = {
    url : Text;
    method : Text;
    body : Blob;
    headers : [HeaderField];
  };
 // 定义HttpResponse
  public type HttpResponse = {
      body : Blob;
      headers : [HeaderField];
      status_code : Nat16;
   };

  public shared query func http_request(request:HttpRequest): async HttpResponse {
     {
      body = Text.encodeUtf8(Nat.toText(currentValue));
      headers =[];
      streaming_strategy = null;
      status_code = 200;
    }
  };

 public func increment() : async () {
    currentValue += 1;
  };

  public query func get() : async Nat {
    currentValue
  };

  public func set(n: Nat) : async () {
    currentValue := n;
  };

 
}