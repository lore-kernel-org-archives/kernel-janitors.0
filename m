From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 12 Nov 2014 16:57:26 +0000
Subject: Re: amd-xgbe: Initial AMD 10GbE platform driver
Message-Id: <54639176.7000207@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141112120329.GA12773@mwanda>
In-Reply-To: <20141112120329.GA12773@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/12/2014 06:03 AM, Dan Carpenter wrote:
> Hello Lendacky, Thomas,
>
> The patch c5aa9e3b8156: "amd-xgbe: Initial AMD 10GbE platform driver"
> from Jun 5, 2014, leads to the following Smatch warning:
>
> 	drivers/net/ethernet/amd/xgbe/xgbe-dev.c:1633 xgbe_dev_read()
> 	warn: we tested 'err' before and it was 'true'
>
> drivers/net/ethernet/amd/xgbe/xgbe-dev.c
>    1628          /* Check for errors (only valid in last descriptor) */
>    1629          err = XGMAC_GET_BITS_LE(rdesc->desc3, RX_NORMAL_DESC3, ES);
>    1630          etlt = XGMAC_GET_BITS_LE(rdesc->desc3, RX_NORMAL_DESC3, ETLT);
>    1631          DBGPR("  err=%u, etlt=%#x\n", err, etlt);
>    1632
>    1633          if (!err || (err && !etlt)) {
>                      ^^^^^^^^^^^^^^^^^^^^^^
> Smatch is saying that we could re-write this as:
>
> 		if (!err || !etlt) {
>
> Which is true, but I'm not sure if that was really the original intent
> of the code.  If it was then maybe we could make it more explicit by

The original intent is to handle the case where err is zero (no error)
or err is one but etlt is zero (no error, even though err is one).

I'll step back a bit and try to see what looks best.  I'm leaning
towards the Smatch suggestion and I'll just add a comment explaining
it.

Thanks,
Tom

> saying:
>
> 	if (etlt = 0x00) {
> 		/* do nothing */
> 	} else if (!err) {
> 		if (etlt = 0x09 &&
> 		...
> 	} else {
> 		if (etlt = 0x05 || etlt = 0x06)
> 		...
>
>    1634                  if ((etlt = 0x09) &&
>    1635                      (netdev->features & NETIF_F_HW_VLAN_CTAG_RX)) {
>    1636                          XGMAC_SET_BITS(packet->attributes, RX_PACKET_ATTRIBUTES,
>    1637                                         VLAN_CTAG, 1);
>    1638                          packet->vlan_ctag = XGMAC_GET_BITS_LE(rdesc->desc0,
>    1639                                                                RX_NORMAL_DESC0,
>    1640                                                                OVT);
>    1641                          DBGPR("  vlan-ctag=0x%04x\n", packet->vlan_ctag);
>    1642                  }
>    1643          } else {
>    1644                  if ((etlt = 0x05) || (etlt = 0x06))
>    1645                          XGMAC_SET_BITS(packet->attributes, RX_PACKET_ATTRIBUTES,
>    1646                                         CSUM_DONE, 0);
>    1647                  else
>    1648                          XGMAC_SET_BITS(packet->errors, RX_PACKET_ERRORS,
>    1649                                         FRAME, 1);
>    1650          }
>    1651
>
> regards,
> dan carpenter
>
