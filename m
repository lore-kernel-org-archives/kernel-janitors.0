From: Tomas Bortoli <tomasbortoli@gmail.com>
Date: Sat, 30 Mar 2019 22:44:29 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <b2a2b63a-c5f0-5d03-7516-668df6049c95@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------57FE852E33794623DFB17A21"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam>
 <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
In-Reply-To: <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------57FE852E33794623DFB17A21
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,

sorry for the multiple emails but I have checked again the code and
looks like process_adv_report() reads from ev->data for a size of
ev->length.

I attach a patch that applies the bound check to both
hci_le_ext_adv_report_evt() and hci_le_adv_report_evt().

Let me know your opinion,
Best regards,
Tomas

On 3/30/19 10:20 AM, Tomas Bortoli wrote:
> Hi Dan,
> 
> On 3/30/19 8:25 AM, Dan Carpenter wrote:
>> There is a potential out of bounds if "ev->length" is too high or if the
>> number of reports are too many.
>>
>> Fixes: c215e9397b00 ("Bluetooth: Process extended ADV report event")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-By: Tomas Bortoli <tomasbortoli@gmail.com>
> 
>> ---
>> Not tested.  I suck at pointer math, and I don't know why the protocol
>> requires a "+ 1".  Please review carefully.
>>
>>  net/bluetooth/hci_event.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
>> index 609fd6871c5a..ee945b3d12e1 100644
>> --- a/net/bluetooth/hci_event.c
>> +++ b/net/bluetooth/hci_event.c
>> @@ -5417,6 +5417,7 @@ static void hci_le_ext_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
>>  {
>>  	u8 num_reports = skb->data[0];
>>  	void *ptr = &skb->data[1];
>> +	void *end = &skb->data[skb->len];
>>  
>>  	hci_dev_lock(hdev);
>>  
>> @@ -5425,6 +5426,8 @@ static void hci_le_ext_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
>>  		u8 legacy_evt_type;
>>  		u16 evt_type;
>>  
>> +		if (ptr + sizeof(*ev) + ev->length + 1 > end)
>> +			break;
> 
> Assuming that per each iteration, the while cycle, including the call to
> process_adv_report() read up to (sizeof(*ev) + ev->length + 1) bytes,
> 
> (I don't understand why the +1, but, anyway..)
> 
> If the assumption is correct, then the if condition should be:
> 
> if (ptr + sizeof(*ev) + ev->length + 1 >= end)
> 
> Because as soon as we try to read from the `end` pointer on, we are
> out-of-bound.. the valid skb bytes end at `end-1` (included)
> 
> Note that also hci_le_adv_report_evt() is likely to need the same fix!
> 
> 
>>  		evt_type = __le16_to_cpu(ev->evt_type);
>>  		legacy_evt_type = ext_evt_type_to_legacy(evt_type);
>>  		if (legacy_evt_type != LE_ADV_INVALID) {
>>
> 
> 
> Kind regards,
> Tomas
> 


--------------57FE852E33794623DFB17A21
Content-Type: text/x-patch;
 name="adv.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="adv.patch"

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 609fd6871c5a..275926e0753e 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5345,6 +5345,7 @@ static void hci_le_adv_report_evt(struct hci_dev *h=
dev, struct sk_buff *skb)
 {
 	u8 num_reports =3D skb->data[0];
 	void *ptr =3D &skb->data[1];
+	u8 *end =3D &skb->data[skb->len - 1];
=20
 	hci_dev_lock(hdev);
=20
@@ -5352,6 +5353,9 @@ static void hci_le_adv_report_evt(struct hci_dev *h=
dev, struct sk_buff *skb)
 		struct hci_ev_le_advertising_info *ev =3D ptr;
 		s8 rssi;
=20
+		if (ev->data + ev->length > end)
+			break;
+
 		if (ev->length <=3D HCI_MAX_AD_LENGTH) {
 			rssi =3D ev->data[ev->length];
 			process_adv_report(hdev, ev->evt_type, &ev->bdaddr,
@@ -5417,6 +5421,7 @@ static void hci_le_ext_adv_report_evt(struct hci_de=
v *hdev, struct sk_buff *skb)
 {
 	u8 num_reports =3D skb->data[0];
 	void *ptr =3D &skb->data[1];
+	u8 *end =3D &skb->data[skb->len - 1];
=20
 	hci_dev_lock(hdev);
=20
@@ -5425,6 +5430,9 @@ static void hci_le_ext_adv_report_evt(struct hci_de=
v *hdev, struct sk_buff *skb)
 		u8 legacy_evt_type;
 		u16 evt_type;
=20
+		if (ev->data + ev->length > end)
+			break;
+
 		evt_type =3D __le16_to_cpu(ev->evt_type);
 		legacy_evt_type =3D ext_evt_type_to_legacy(evt_type);
 		if (legacy_evt_type !=3D LE_ADV_INVALID) {

--------------57FE852E33794623DFB17A21--
