From: "Galya Tcharny" <gtcharny@gmail.com>
Date: Thu, 28 Sep 2006 12:58:33 +0000
Subject: [KJ]  [PATCH] Check kmalloc() return value
Message-Id: <933d0f3f0609280558j252cf1c7mef675b748b2d233b@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2000016832=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <933d0f3f0609280058s7bbff814w4237926929367439@mail.gmail.com>
In-Reply-To: <933d0f3f0609280058s7bbff814w4237926929367439@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============2000016832==
Content-Type: multipart/alternative;
    boundary="----------=_1159448329-31896-184"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1159448329-31896-184
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/28/06, Jesper Juhl <jesper.juhl@gmail.com> wrote:

>Your mail client still mangles the patch. The two lines above should
>have been one line. Tell your mailer not to wordwrap lines.
>

Hope I got it right this time.

Thanks,

Galya


drivers/net/au1000_eth.c |    5 ++++-
drivers/net/s2io.c       |    3 +++
2 files changed, 7 insertions(+), 1 deletion(-)


diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff
linux-2.6.18-orig/drivers/net/au1000_eth.c
linux-2.6.18/drivers/net/au1000_eth.c
--- linux-2.6.18-orig/drivers/net/au1000_eth.c  2006-09-27 14:51:
31.000000000 +0300
+++ linux-2.6.18/drivers/net/au1000_eth.c       2006-09-28 12:10:
30.000000000 +0300
@@ -717,7 +717,10 @@ static struct net_device * au1000_probe(
       aup->mii_bus.name = "au1000_eth_mii";
       aup->mii_bus.id = aup->mac_id;
       aup->mii_bus.irq = kmalloc(sizeof(int)*PHY_MAX_ADDR, GFP_KERNEL);
-       for(i = 0; i < PHY_MAX_ADDR; ++i)
+       if (aup->mii_bus.irq == NULL) {
+               goto err_out;
+       }
+       for (i = 0; i < PHY_MAX_ADDR; ++i)
               aup->mii_bus.irq[i] = PHY_POLL;

       /* if known, set corresponding PHY IRQs */
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff
linux-2.6.18-orig/drivers/net/s2io.c
linux-2.6.18/drivers/net/s2io.c
--- linux-2.6.18-orig/drivers/net/s2io.c        2006-09-27 14:51:
33.000000000 +0300
+++ linux-2.6.18/drivers/net/s2io.c     2006-09-28 12:07:54.000000000 +0300
@@ -624,6 +624,9 @@ static int init_shared_mem(struct s2io_n
                       rx_blocks->rxds = kmalloc(sizeof(rxd_info_t)*
                                                 rxd_count[nic->rxd_mode],
                                                 GFP_KERNEL);
+                       if (rx_blocks->rxds == NULL) {
+                               return -ENOMEM;
+                       }
                       for (l=0; l<rxd_count[nic->rxd_mode];l++) {
                               rx_blocks->rxds[l].virt_addr =
                                       rx_blocks->block_virt_addr +

------------=_1159448329-31896-184
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>On 9/28/06, Jesper Juhl &lt;<a href="mailto:jesper.juhl@gmail.com">jesper.juhl@gmail.com</a>&gt; wrote:<br><br>&gt;Your mail client still mangles the patch. The two lines above should<br>&gt;have been one line. Tell your mailer not to wordwrap lines.
<br>&gt;<br><br>Hope I got it right this time.<br>&nbsp;</div>
<div>Thanks,</div>
<div>&nbsp;</div>
<div>Galya</div>
<div>&nbsp;</div>
<div><br>drivers/net/au1000_eth.c |&nbsp;&nbsp;&nbsp;&nbsp;5 ++++-<br>drivers/net/s2io.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;3 +++<br>2 files changed, 7 insertions(+), 1 deletion(-)<br><br><br>diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig
/drivers/net/au1000_eth.c linux-2.6.18/drivers/net/au1000_eth.c<br>--- linux-2.6.18-orig/drivers/net/au1000_eth.c&nbsp;&nbsp;2006-09-27 14:51:31.000000000 +0300<br>+++ linux-2.6.18/drivers/net/au1000_eth.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2006-09-28 12:10:30.000000000
 +0300<br>@@ -717,7 +717,10 @@ static struct net_device * au1000_probe(<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aup-&gt;mii_bus.name = &quot;au1000_eth_mii&quot;;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aup-&gt;mii_bus.id = aup-&gt;mac_id;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aup-&gt;mii_bus.irq = kmalloc(sizeof(int)*PHY_MAX_ADDR, GFP_KERNEL);
<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for(i = 0; i &lt; PHY_MAX_ADDR; ++i)<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (aup-&gt;mii_bus.irq == NULL) {<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err_out;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; PHY_MAX_ADDR; ++i)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aup-&gt;mii_bus.irq[i] = PHY_POLL;
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* if known, set corresponding PHY IRQs */<br>diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/net/s2io.c linux-2.6.18/drivers/net/s2io.c<br>--- linux-2.6.18-orig/drivers/net/s2io.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2006-09-27 14:51:
33.000000000 +0300<br>+++ linux-2.6.18/drivers/net/s2io.c&nbsp;&nbsp;&nbsp;&nbsp; 2006-09-28 12:07:54.000000000 +0300<br>@@ -624,6 +624,9 @@ static int init_shared_mem(struct s2io_n<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rx_blocks-&gt;rxds = kmalloc(sizeof(rxd_info_t)*
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rxd_count[nic-&gt;rxd_mode],<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rx_blocks-&gt;rxds == NULL) {<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return!
 -ENOMEM;
<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (l=0; l&lt;rxd_count[nic-&gt;rxd_mode];l++) {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rx_blocks-&gt;rxds[l].virt_addr =<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rx_blocks-&gt;block_virt_addr +
<br>&nbsp;</div>

------------=_1159448329-31896-184--

--===============2000016832==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2000016832==--
