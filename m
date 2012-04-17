From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Apr 2012 06:47:25 +0000
Subject: [patch] Staging: wlags49_h2: reading past the end of array
Message-Id: <20120417064724.GH26756@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original code had some confusion about the dimensions of the array.
It should have been an array of 2 element arrays but it was declared as
an array of 50 element arrays.

The limitter on the outside array should have been
ARRAY_SIZE(chan_freq_list) or 26 but instead 50 was used.  It meant that
we read past the end.  It's probably harmless but it's obviously worth
fixing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/wlags49_h2/wl_util.c b/drivers/staging/wlags49_h2/wl_util.c
index f104e6f..404ec7d 100644
--- a/drivers/staging/wlags49_h2/wl_util.c
+++ b/drivers/staging/wlags49_h2/wl_util.c
@@ -98,8 +98,7 @@
  ******************************************************************************/
 
 /* A matrix which maps channels to frequencies */
-#define MAX_CHAN_FREQ_MAP_ENTRIES   50
-static const long chan_freq_list[][MAX_CHAN_FREQ_MAP_ENTRIES] +static const long chan_freq_list[][2]  {
     {1,2412},
     {2,2417},
@@ -846,7 +845,7 @@ int wl_is_a_valid_chan( int channel )
     }
 
     /* Iterate through the matrix and retrieve the frequency */
-    for( i = 0; i < MAX_CHAN_FREQ_MAP_ENTRIES; i++ ) {
+    for( i = 0; i < ARRAY_SIZE(chan_freq_list); i++ ) {
         if( chan_freq_list[i][0] = channel ) {
             return 1;
         }
@@ -884,7 +883,7 @@ int wl_is_a_valid_freq( long frequency )
 
 
     /* Iterate through the matrix and retrieve the channel */
-    for( i = 0; i < MAX_CHAN_FREQ_MAP_ENTRIES; i++ ) {
+    for( i = 0; i < ARRAY_SIZE(chan_freq_list); i++ ) {
         if( chan_freq_list[i][1] = frequency ) {
             return 1;
         }
@@ -927,7 +926,7 @@ long wl_get_freq_from_chan( int channel )
     }
 
     /* Iterate through the matrix and retrieve the frequency */
-    for( i = 0; i < MAX_CHAN_FREQ_MAP_ENTRIES; i++ ) {
+    for( i = 0; i < ARRAY_SIZE(chan_freq_list); i++ ) {
         if( chan_freq_list[i][0] = channel ) {
             return chan_freq_list[i][1];
         }
@@ -965,7 +964,7 @@ int wl_get_chan_from_freq( long frequency )
 
 
     /* Iterate through the matrix and retrieve the channel */
-    for( i = 0; i < MAX_CHAN_FREQ_MAP_ENTRIES; i++ ) {
+    for( i = 0; i < ARRAY_SIZE(chan_freq_list); i++ ) {
         if( chan_freq_list[i][1] = frequency ) {
             return chan_freq_list[i][0];
         }
