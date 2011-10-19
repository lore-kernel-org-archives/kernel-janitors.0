From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Oct 2011 06:15:10 +0000
Subject: [patch] KVM: make checks stricter in coalesced_mmio_in_range()
Message-Id: <20111019061510.GA12399@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

My testing version of Smatch complains that addr and len come from
the user and they can wrap.  The path is:
  -> kvm_vm_ioctl()
     -> kvm_vm_ioctl_unregister_coalesced_mmio()
        -> coalesced_mmio_in_range()

I don't know what the implications are of wrapping here, but we may
as well fix it, if only to silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/virt/kvm/coalesced_mmio.c b/virt/kvm/coalesced_mmio.c
index a6ec206..88b2fe3 100644
--- a/virt/kvm/coalesced_mmio.c
+++ b/virt/kvm/coalesced_mmio.c
@@ -28,9 +28,15 @@ static int coalesced_mmio_in_range(struct kvm_coalesced_mmio_dev *dev,
 	 * (addr,len) is fully included in
 	 * (zone->addr, zone->size)
 	 */
-
-	return (dev->zone.addr <= addr &&
-		addr + len <= dev->zone.addr + dev->zone.size);
+	if (len < 0)
+		return 0;
+	if (addr + len < addr)
+		return 0;
+	if (addr < dev->zone.addr)
+		return 0;
+	if (addr + len > dev->zone.addr + dev->zone.size)
+		return 0;
+	return 1;
 }
 
 static int coalesced_mmio_has_room(struct kvm_coalesced_mmio_dev *dev)
