From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 22 Apr 2004 22:15:46 +0000
Subject: [Kernel-janitors] [PATCH] drivers/scsi/aic7xxx_old MIN/MAX/NUMBER
Message-Id: <40884412.6060108@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040502030900050201040200"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040502030900050201040200
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.6-rc1) removes unnecessary min/max/number macros and 
changes calls to use kernel.h macros instead.

Feedback is always welcome
Michael


--------------040502030900050201040200
Content-Type: text/plain;
 name="minmax_drivers_scsi_aisold.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_scsi_aisold.patch"

diff -Naur -X dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx_old/aic7xxx_proc.c linux-2.6.5.new/drivers/scsi/aic7xxx_old/aic7xxx_proc.c
--- linux-2.6.5.org/drivers/scsi/aic7xxx_old/aic7xxx_proc.c	2004-04-04 05:38:14.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx_old/aic7xxx_proc.c	2004-04-22 23:47:18.000000000 +0200
@@ -319,13 +319,13 @@
         aic_dev->r_total+aic_dev->w_total, aic_dev->r_total, aic_dev->w_total);
     size += sprintf(BLS, "%s\n", HDRB);
     size += sprintf(BLS, "   Reads:");
-    for (i = 0; i < NUMBER(aic_dev->r_bins); i++)
+    for (i = 0; i < ARRAY_SIZE(aic_dev->r_bins); i++)
     {
       size += sprintf(BLS, " %10ld", aic_dev->r_bins[i]);
     }
     size += sprintf(BLS, "\n");
     size += sprintf(BLS, "  Writes:");
-    for (i = 0; i < NUMBER(aic_dev->w_bins); i++)
+    for (i = 0; i < ARRAY_SIZE(aic_dev->w_bins); i++)
     {
       size += sprintf(BLS, " %10ld", aic_dev->w_bins[i]);
     }
@@ -347,7 +347,7 @@
   else
   {
     *start = buffer;
-    length = MIN(length, size - offset);
+    length = min_t(int, length, size - offset);
     memcpy(buffer, &aic7xxx_buffer[offset], length);
   }
 
diff -Naur -X dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx_old.c linux-2.6.5.new/drivers/scsi/aic7xxx_old.c
--- linux-2.6.5.org/drivers/scsi/aic7xxx_old.c	2004-04-22 19:04:33.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx_old.c	2004-04-22 23:46:47.000000000 +0200
@@ -254,9 +254,6 @@
 
 #define AIC7XXX_C_VERSION  "5.2.6"
 
-#define NUMBER(arr)     (sizeof(arr) / sizeof(arr[0]))
-#define MIN(a,b)        (((a) < (b)) ? (a) : (b))
-#define MAX(a,b)        (((a) > (b)) ? (a) : (b))
 #define ALL_TARGETS -1
 #define ALL_CHANNELS -1
 #define ALL_LUNS -1
@@ -1376,7 +1373,7 @@
 
   while ((p = strsep(&s, ",.")) != NULL)
   {
-    for (i = 0; i < NUMBER(options); i++)
+    for (i = 0; i < ARRAY_SIZE(options); i++)
     {
       n = strlen(options[i].name);
       if (!strncmp(options[i].name, p, n))
@@ -1423,7 +1420,7 @@
                   else if (instance >= 0)
                     instance++;
                   if ( (device >= MAX_TARGETS) || 
-                       (instance >= NUMBER(aic7xxx_tag_info)) )
+                       (instance >= ARRAY_SIZE(aic7xxx_tag_info)) )
                     done = TRUE;
                   tok++;
                   if (!done)
@@ -1447,7 +1444,7 @@
                     }
                   }
                   if ( (instance >= 0) && (device >= 0) &&
-                       (instance < NUMBER(aic7xxx_tag_info)) &&
+                       (instance < ARRAY_SIZE(aic7xxx_tag_info)) &&
                        (device < MAX_TARGETS) )
                     aic7xxx_tag_info[instance].tag_commands[device] =
                       simple_strtoul(tok, NULL, 0) & 0xff;
@@ -1658,7 +1655,7 @@
         {
           int end_addr;
 
-          end_addr = MIN(address, skip_addr);
+          end_addr = min_t(int, address, skip_addr);
           address_offset += end_addr - i;
           i = skip_addr;
         }
@@ -1884,7 +1881,7 @@
       if(!(p->features & AHC_ULTRA3))
       {
         *options = 0;
-        maxsync = MAX(maxsync, AHC_SYNCRATE_ULTRA2);
+        maxsync = max_t(unsigned int, maxsync, AHC_SYNCRATE_ULTRA2);
       }
       break;
     case MSG_EXT_PPR_OPTION_DT_CRC_QUICK:
@@ -1892,7 +1889,7 @@
       if(!(p->features & AHC_ULTRA3))
       {
         *options = 0;
-        maxsync = MAX(maxsync, AHC_SYNCRATE_ULTRA2);
+        maxsync = max_t(unsigned int, maxsync, AHC_SYNCRATE_ULTRA2);
       }
       else
       {
@@ -1916,7 +1913,7 @@
       break;
     default:
       *options = 0;
-      maxsync = MAX(maxsync, AHC_SYNCRATE_ULTRA2);
+      maxsync = max_t(unsigned int, maxsync, AHC_SYNCRATE_ULTRA2);
       break;
   }
   syncrate = &aic7xxx_syncrates[maxsync];
@@ -2057,7 +2054,7 @@
     else
       maxoffset = MAX_OFFSET_8BIT;
   }
-  *offset = MIN(*offset, maxoffset);
+  *offset = min(*offset, maxoffset);
 }
 
 /*+F*************************************************************************
@@ -2570,7 +2567,7 @@
         break;
       }
     }
-    scb_count = MIN( (i-1), p->scb_data->maxscbs - p->scb_data->numscbs);
+    scb_count = min( (i-1), p->scb_data->maxscbs - p->scb_data->numscbs);
     scb_ap = (struct aic7xxx_scb *)kmalloc(sizeof (struct aic7xxx_scb) * scb_count
 					   + sizeof(struct aic7xxx_scb_dma), GFP_ATOMIC);
     if (scb_ap == NULL)
@@ -5042,7 +5039,7 @@
             if(p->user[tindex].offset)
             {
               aic_dev->needsdtr_copy = 1;
-              aic_dev->goal.period = MAX(10,p->user[tindex].period);
+              aic_dev->goal.period = max_t(unsigned char, 10,p->user[tindex].period);
               if(p->features & AHC_ULTRA2)
               {
                 aic_dev->goal.offset = MAX_OFFSET_ULTRA2;
@@ -5086,8 +5083,8 @@
            * the device isn't allowed to send values greater than the ones
            * we first sent to it.
            */
-          new_period = MAX(period, aic_dev->goal.period);
-          new_offset = MIN(offset, aic_dev->goal.offset);
+          new_period = max_t(unsigned int, period, aic_dev->goal.period);
+          new_offset = min_t(unsigned int, offset, aic_dev->goal.offset);
         }
  
         /*
@@ -5208,7 +5205,7 @@
             if(p->user[tindex].offset)
             {
               aic_dev->needsdtr_copy = 1;
-              aic_dev->goal.period = MAX(10,p->user[tindex].period);
+              aic_dev->goal.period = max_t(unsigned char, 10, p->user[tindex].period);
               if(p->features & AHC_ULTRA2)
               {
                 aic_dev->goal.offset = MAX_OFFSET_ULTRA2;
@@ -6413,7 +6410,7 @@
     unsigned char errno = aic_inb(p, ERROR);
 
     printk(KERN_ERR "(scsi%d) BRKADRINT error(0x%x):\n", p->host_no, errno);
-    for (i = 0; i < NUMBER(hard_error); i++)
+    for (i = 0; i < ARRAY_SIZE(hard_error); i++)
     {
       if (errno & hard_error[i].errno)
       {
@@ -6562,7 +6559,7 @@
       else
       {
         aic_dev->needsdtr = aic_dev->needsdtr_copy = 1;
-        aic_dev->goal.period = MAX(10, aic_dev->goal.period);
+        aic_dev->goal.period = max_t(unsigned char, 10, aic_dev->goal.period);
         aic_dev->goal.options = 0;
       }
     }
@@ -6673,7 +6670,7 @@
     }
     else
     {
-      if (p->instance >= NUMBER(aic7xxx_tag_info))
+      if (p->instance >= ARRAY_SIZE(aic7xxx_tag_info))
       {
         static int print_warning = TRUE;
         if(print_warning)
@@ -6850,7 +6847,7 @@
     buf[i] = inb(base + i);
   }
 
-  for (i = 0; i < NUMBER(AIC7xxx); i++)
+  for (i = 0; i < ARRAY_SIZE(AIC7xxx); i++)
   {
     /*
      * Signature match on enabled card?
@@ -9199,7 +9196,7 @@
     unsigned int  devconfig, i, oldverbose;
     struct pci_dev *pdev = NULL;
 
-    for (i = 0; i < NUMBER(aic_pdevs); i++)
+    for (i = 0; i < ARRAY_SIZE(aic_pdevs); i++)
     {
       pdev = NULL;
       while ((pdev = pci_find_device(aic_pdevs[i].vendor_id,
@@ -9698,7 +9695,7 @@
    * EISA/VL-bus card signature probe.
    */
   slot = MINSLOT;
-  while ( (slot <= MAXSLOT) && 
+  while ( (slot <= MAXSLOT) &&
          !(aic7xxx_no_probe) )
   {
     base = SLOTBASE(slot) + MINREG;
@@ -10097,7 +10094,7 @@
       int i;
       
       left = found;
-      for (i=0; i<NUMBER(sort_list); i++)
+      for (i=0; i<ARRAY_SIZE(sort_list); i++)
       {
         temp_p = sort_list[i];
         while(temp_p != NULL)

--------------040502030900050201040200
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040502030900050201040200--
