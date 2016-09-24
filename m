From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 06:31:19 +0000
Subject: [PATCH 7/7] iio: Adjust checks for null pointers in six functions
Message-Id: <8e0c9fdd-fc9a-0093-278f-00f3beb2a8f6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <c11fbb47-1fd3-4e9e-042e-0f271cfef814@users.sourceforge.net>
In-Reply-To: <c11fbb47-1fd3-4e9e-042e-0f271cfef814@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 08:00:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" can point information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/iio/industrialio-buffer.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-b=
uffer.c
index 57e201a..6893639 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -310,7 +310,7 @@ static int iio_scan_mask_set(struct iio_dev *indio_dev,
 	trialmask =3D kmalloc_array(BITS_TO_LONGS(indio_dev->masklength),
 				  sizeof(*trialmask),
 				  GFP_KERNEL);
-	if (trialmask =3D NULL)
+	if (!trialmask)
 		return -ENOMEM;
 	if (!indio_dev->masklength) {
 		WARN(1, "Trying to set scanmask prior to registering buffer\n");
@@ -711,7 +711,7 @@ static int iio_verify_update(struct iio_dev *indio_dev,
 	/* What scan mask do we actually have? */
 	compound_mask =3D kcalloc(BITS_TO_LONGS(indio_dev->masklength),
 				sizeof(long), GFP_KERNEL);
-	if (compound_mask =3D NULL)
+	if (!compound_mask)
 		return -ENOMEM;
=20
 	scan_timestamp =3D false;
@@ -736,7 +736,7 @@ static int iio_verify_update(struct iio_dev *indio_dev,
 				    compound_mask,
 				    strict_scanmask);
 		kfree(compound_mask);
-		if (scan_mask =3D NULL)
+		if (!scan_mask)
 			return -EINVAL;
 	} else {
 	    scan_mask =3D compound_mask;
@@ -940,7 +940,7 @@ int iio_update_buffers(struct iio_dev *indio_dev,
 		goto out_unlock;
 	}
=20
-	if (indio_dev->info =3D NULL) {
+	if (!indio_dev->info) {
 		ret =3D -ENODEV;
 		goto out_unlock;
 	}
@@ -1130,11 +1130,11 @@ int iio_buffer_alloc_sysfs_and_mask(struct iio_dev =
*indio_dev)
 				indio_dev->scan_index_timestamp  					channels[i].scan_index;
 		}
-		if (indio_dev->masklength && buffer->scan_mask =3D NULL) {
+		if (indio_dev->masklength && !buffer->scan_mask) {
 			buffer->scan_mask =3D kcalloc(BITS_TO_LONGS(indio_dev->masklength),
 						    sizeof(*buffer->scan_mask),
 						    GFP_KERNEL);
-			if (buffer->scan_mask =3D NULL) {
+			if (!buffer->scan_mask) {
 				ret =3D -ENOMEM;
 				goto error_cleanup_dynamic;
 			}
@@ -1146,7 +1146,7 @@ int iio_buffer_alloc_sysfs_and_mask(struct iio_dev *i=
ndio_dev)
 	buffer->scan_el_group.attrs =3D kcalloc(attrcount + 1,
 					      sizeof(buffer->scan_el_group.attrs[0]),
 					      GFP_KERNEL);
-	if (buffer->scan_el_group.attrs =3D NULL) {
+	if (!buffer->scan_el_group.attrs) {
 		ret =3D -ENOMEM;
 		goto error_free_scan_mask;
 	}
@@ -1291,7 +1291,7 @@ static int iio_buffer_add_demux(struct iio_buffer *bu=
ffer,
 		(*p)->length +=3D length;
 	} else {
 		*p =3D kmalloc(sizeof(**p), GFP_KERNEL);
-		if (*p =3D NULL)
+		if (!*p)
 			return -ENOMEM;
 		(*p)->from =3D in_loc;
 		(*p)->to =3D out_loc;
@@ -1356,7 +1356,7 @@ static int iio_buffer_update_demux(struct iio_dev *in=
dio_dev,
 		in_loc +=3D length;
 	}
 	buffer->demux_bounce =3D kzalloc(out_loc, GFP_KERNEL);
-	if (buffer->demux_bounce =3D NULL) {
+	if (!buffer->demux_bounce) {
 		ret =3D -ENOMEM;
 		goto error_clear_mux_table;
 	}
--=20
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
