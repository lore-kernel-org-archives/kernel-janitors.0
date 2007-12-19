From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Wed, 19 Dec 2007 19:52:36 +0000
Subject: [PATCH 3/3 - 2nd try] remove explicit memset to memory allocated with k[zc]alloc
Message-Id: <001301c84278$b4ab19c0$0b01a8c0@bureau>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

1) Remove an explicit memset(.., 0, ...) to a varialable allocated with
kzalloc.

2) Allocate 'src' with kmalloc instead of kzalloc as all elements of the
'src' buffer are initialized in a 'for(...)' loop.

3) remove useless 'sizeof(u8)', which always returns 1, when computing the
size of the memory to be allocated.


Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

---

--- linux-2.6.24-rc5/drivers/dma/iop-adma.c 2007-12-16 11:15:52.000000000
+0100
+++ linux-2.6.24-rc5/drivers/dma/iop-adma.c.cj 2007-12-19 20:44:58.000000000
+0100
@@ -858,10 +858,10 @@ static int __devinit iop_adma_memcpy_sel

  dev_dbg(device->common.dev, "%s\n", __FUNCTION__);

- src = kzalloc(sizeof(u8) * IOP_ADMA_TEST_SIZE, GFP_KERNEL);
+ src = kmalloc(IOP_ADMA_TEST_SIZE, GFP_KERNEL);
  if (!src)
   return -ENOMEM;
- dest = kzalloc(sizeof(u8) * IOP_ADMA_TEST_SIZE, GFP_KERNEL);
+ dest = kzalloc(IOP_ADMA_TEST_SIZE, GFP_KERNEL);
  if (!dest) {
   kfree(src);
   return -ENOMEM;
@@ -871,8 +871,6 @@ static int __devinit iop_adma_memcpy_sel
  for (i = 0; i < IOP_ADMA_TEST_SIZE; i++)
   ((u8 *) src)[i] = (u8)i;

- memset(dest, 0, IOP_ADMA_TEST_SIZE);
-
  /* Start copy, using first DMA channel */
  dma_chan = container_of(device->common.channels.next,
     struct dma_chan,


