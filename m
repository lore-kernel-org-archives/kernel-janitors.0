From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Oct 2017 12:19:21 +0000
Subject: [PATCH] HID: sensor: Use the correct type instead of a void pointer
Message-Id: <20171026121921.kmyk42wo32juv6qj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

It's cleaner to declare this with the correct type instead of using a
void pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hid/hid-sensor-custom.c b/drivers/hid/hid-sensor-custom.c
index 0bcf041368c7..4f509f13f347 100644
--- a/drivers/hid/hid-sensor-custom.c
+++ b/drivers/hid/hid-sensor-custom.c
@@ -485,7 +485,7 @@ static int hid_sensor_custom_add_field(struct hid_sensor_custom *sensor_inst,
 				       struct hid_field *field)
 {
 	struct hid_sensor_custom_field *sensor_field;
-	void *fields;
+	struct hid_sensor_custom_field *fields;
 
 	fields = krealloc(sensor_inst->fields,
 			  (sensor_inst->sensor_field_count + 1) *
