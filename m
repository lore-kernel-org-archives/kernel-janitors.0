From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 10 Mar 2005 19:21:49 +0000
Subject: [KJ] [PATCH] drivers/atm/ambassador.c: fix sparse warnings
Message-Id: <200503102220.32552.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33747274187147891=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33747274187147891==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Cross-sparse tested on i386, x86_64, ppc64, sparc, alpha.

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk6-sparse/drivers/atm/ambassador.c
===================================================================
--- linux-2.6.11-bk6-sparse.orig/drivers/atm/ambassador.c	2005-03-10 17:59:07.000000000 +0200
+++ linux-2.6.11-bk6-sparse/drivers/atm/ambassador.c	2005-03-10 22:03:58.000000000 +0200
@@ -345,7 +345,7 @@ static inline u32 rd_plain (const amb_de
 }
 
 static inline void wr_mem (const amb_dev * dev, size_t addr, u32 data) {
-  u32 be = cpu_to_be32 (data);
+  __be32 be = cpu_to_be32 (data);
   PRINTD (DBG_FLOW|DBG_REGS, "wr: %08zx <- %08x b[%08x]", addr, data, be);
 #ifdef AMB_MMIO
   dev->membase[addr / sizeof(u32)] = be;
@@ -356,9 +356,9 @@ static inline void wr_mem (const amb_dev
 
 static inline u32 rd_mem (const amb_dev * dev, size_t addr) {
 #ifdef AMB_MMIO
-  u32 be = dev->membase[addr / sizeof(u32)];
+  __be32 be = dev->membase[addr / sizeof(u32)];
 #else
-  u32 be = inl (dev->iobase + addr);
+  __be32 be = inl (dev->iobase + addr);
 #endif
   u32 data = be32_to_cpu (be);
   PRINTD (DBG_FLOW|DBG_REGS, "rd: %08zx -> %08x b[%08x]", addr, data, be);
@@ -2007,7 +2007,7 @@ static int __devinit ucode_init (loader_
 
 /********** give adapter parameters **********/
   
-static inline u32 bus_addr(void * addr) {
+static inline __be32 bus_addr(void * addr) {
     return cpu_to_be32 (virt_to_bus (addr));
 }
 
Index: linux-2.6.11-bk6-sparse/drivers/atm/ambassador.h
===================================================================
--- linux-2.6.11-bk6-sparse.orig/drivers/atm/ambassador.h	2005-03-02 09:38:33.000000000 +0200
+++ linux-2.6.11-bk6-sparse/drivers/atm/ambassador.h	2005-03-10 22:03:57.000000000 +0200
@@ -342,21 +342,21 @@ typedef struct {
 #define MAX_TRANSFER_DATA 11
 
 typedef struct {
-  u32 address;
-  u32 count;
-  u32 data[MAX_TRANSFER_DATA];
+  __be32 address;
+  __be32 count;
+  __be32 data[MAX_TRANSFER_DATA];
 } transfer_block;
 
 typedef struct {
-  u32 result;
-  u32 command;
+  __be32 result;
+  __be32 command;
   union {
     transfer_block transfer;
-    u32 version;
-    u32 start;
-    u32 data[MAX_COMMAND_DATA];
+    __be32 version;
+    __be32 start;
+    __be32 data[MAX_COMMAND_DATA];
   } payload;
-  u32 valid;
+  __be32 valid;
 } loader_block;
 
 /* command queue */
@@ -366,46 +366,46 @@ typedef struct {
 typedef	struct {
   union {
     struct {
-      u32 vc;
-      u32 flags;
-      u32 rate;
+      __be32 vc;
+      __be32 flags;
+      __be32 rate;
     } open;
     struct {
-      u32 vc;
-      u32 rate;
+      __be32 vc;
+      __be32 rate;
     } modify_rate;
     struct {
-      u32 vc;
-      u32 flags;
+      __be32 vc;
+      __be32 flags;
     } modify_flags;
     struct {
-      u32 vc;
+      __be32 vc;
     } close;
     struct {
-      u32 lower4;
-      u32 upper2;
+      __be32 lower4;
+      __be32 upper2;
     } bia;
     struct {
-      u32 address;
+      __be32 address;
     } suni;
     struct {
-      u32 major;
-      u32 minor;
+      __be32 major;
+      __be32 minor;
     } version;
     struct {
-      u32 read;
-      u32 write;
+      __be32 read;
+      __be32 write;
     } speed;
     struct {
-      u32 flags;
+      __be32 flags;
     } flush;
     struct {
-      u32 address;
-      u32 data;
+      __be32 address;
+      __be32 data;
     } memory;
-    u32 par[3];
+    __be32 par[3];
   } args;
-  u32 request;
+  __be32 request;
 } command;
 
 /* transmit queues and associated structures */
@@ -417,8 +417,8 @@ typedef	struct {
 /* TX is described by 1+ tx_frags followed by a tx_frag_end */
 
 typedef struct {
-  u32 bytes;
-  u32 address;
+  __be32 bytes;
+  __be32 address;
 } tx_frag;
 
 /* apart from handle the fields here are for the adapter to play with
@@ -452,9 +452,9 @@ typedef union {
 /* this "points" to the sequence of fragments and trailer */
 
 typedef	struct {
-  u16	vc;
-  u16	tx_descr_length;
-  u32	tx_descr_addr;
+  __be16	vc;
+  __be16	tx_descr_length;
+  __be32	tx_descr_addr;
 } tx_in;
 
 /* handle is the handle from tx_in */
@@ -471,17 +471,17 @@ typedef	struct {
 
 typedef struct {
   u32  handle;
-  u16  vc;
-  u16  lec_id; // unused
-  u16  status;
-  u16  length;
+  __be16  vc;
+  __be16  lec_id; // unused
+  __be16  status;
+  __be16  length;
 } rx_out;
 
 /* buffer supply structure */
 
 typedef	struct {
   u32 handle;
-  u32 host_address;
+  __be32 host_address;
 } rx_in;
 
 /* This first structure is the area in host memory where the adapter
@@ -495,22 +495,22 @@ typedef	struct {
    adapter. */
 
 typedef struct {
-  u32 command_start;		/* SRB commands completions */
-  u32 command_end;		/* SRB commands completions */
-  u32 tx_start;
-  u32 tx_end;
-  u32 txcom_start;		/* tx completions */
-  u32 txcom_end;		/* tx completions */
+  __be32 command_start;		/* SRB commands completions */
+  __be32 command_end;		/* SRB commands completions */
+  __be32 tx_start;
+  __be32 tx_end;
+  __be32 txcom_start;		/* tx completions */
+  __be32 txcom_end;		/* tx completions */
   struct {
-    u32 buffer_start;
-    u32 buffer_end;
+    __be32 buffer_start;
+    __be32 buffer_end;
     u32 buffer_q_get;
     u32 buffer_q_end;
     u32 buffer_aptr;
-    u32 rx_start;		/* rx completions */
-    u32 rx_end;
+    __be32 rx_start;		/* rx completions */
+    __be32 rx_end;
     u32 rx_ptr;
-    u32 buffer_size;		/* size of host buffer */
+    __be32 buffer_size;		/* size of host buffer */
   } rec_struct[NUM_RX_POOLS];
 #ifdef AMB_NEW_MICROCODE
   u16 init_flags;

--===============33747274187147891==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33747274187147891==--
