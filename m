From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 20 Dec 2005 15:05:09 +0000
Subject: Re: [KJ] [Patch 2/5] Cleanup MIN/MAX Macro usage in eicon/di.c
Message-Id: <1135091109.25956.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62323025454334613=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1135084556.24065.6.camel@alice>
In-Reply-To: <1135084556.24065.6.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============62323025454334613==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

On Tue, 2005-12-20 at 06:54 -0700, Matthew Wilcox wrote:
> On Tue, Dec 20, 2005 at 02:15:56PM +0100, Eric Sesterhenn / snakebyte wrote:
> > -      clength = MIN((word)(270-length),X[i].PLength-this->XOffset);
> > +      clength = min((word)(270-length),(word)(X[i].PLength-this->XOffset));
> 
> perhaps you should use min_t?

revisited patch, it now uses min_t instead of min,
compile tested.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc6/drivers/isdn/hardware/eicon/di.c.orig	2005-12-20 09:56:54.000000000 +0100
+++ linux-2.6.15-rc6/drivers/isdn/hardware/eicon/di.c	2005-12-20 15:06:28.000000000 +0100
@@ -133,7 +133,7 @@ void pr_out(ADAPTER * a)
     i = this->XCurrent;
     X = PTR_X(a,this);
     while(i<this->XNum && length<270) {
-      clength = MIN((word)(270-length),X[i].PLength-this->XOffset);
+      clength = min_t(word, 270-length, X[i].PLength-this->XOffset);
       a->ram_out_buffer(a,
                         &ReqOut->XBuffer.P[length],
                         PTR_P(a,this,&X[i].P[this->XOffset]),
@@ -622,7 +622,7 @@ byte isdn_ind(ADAPTER * a,
                                                      sizeof(a->stream_buffer),
                                                      &final, NULL, NULL);
         }
-        IoAdapter->RBuffer.length = MIN(MLength, 270);
+        IoAdapter->RBuffer.length = min_t(word, MLength, 270);
         if (IoAdapter->RBuffer.length != MLength) {
           this->complete = 0;
         } else {
@@ -676,9 +676,9 @@ byte isdn_ind(ADAPTER * a,
         this->RCurrent++;
       }
       if (cma) {
-        clength = MIN(MLength, R[this->RCurrent].PLength-this->ROffset);
+        clength = min_t(word, MLength, R[this->RCurrent].PLength-this->ROffset);
       } else {
-        clength = MIN(a->ram_inw(a, &RBuffer->length)-offset,
+        clength = min(a->ram_inw(a, &RBuffer->length)-offset,
                       R[this->RCurrent].PLength-this->ROffset);
       }
       if(R[this->RCurrent].P) {



--===============62323025454334613==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62323025454334613==--
