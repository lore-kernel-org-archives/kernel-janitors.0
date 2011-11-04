From: Jay Vosburgh <fubar@us.ibm.com>
Date: Fri, 04 Nov 2011 20:02:01 +0000
Subject: Re: [patch] bonding: comparing a u8 with -1 is always false
Message-Id: <10444.1320436921@death>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111104182138.GB5796@elgon.mountain>
In-Reply-To: <20111104182138.GB5796@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Weiping Pan <wpan@redhat.com>, Andy Gospodarek <andy@greyhouse.net>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org, Ben Hutchings <bhutchings@solarflare.com>


Dan Carpenter <dan.carpenter@oracle.com> wrote:
>slave->duplex is a u8 type so the in bond_info_show_slave() when we
>check "if (slave->duplex = -1)", it's always false.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
>index b2b9109..b0c5772 100644
>--- a/drivers/net/bonding/bond_main.c
>+++ b/drivers/net/bonding/bond_main.c
>@@ -560,8 +560,8 @@ static int bond_update_speed_duplex(struct slave *slave)
> 	u32 slave_speed;
> 	int res;
>
>-	slave->speed = -1;
>-	slave->duplex = -1;
>+	slave->speed = SPEED_UNKNOWN;
>+	slave->duplex = DUPLEX_UNKNOWN;
>
> 	res = __ethtool_get_settings(slave_dev, &ecmd);
> 	if (res < 0)
>diff --git a/drivers/net/bonding/bond_procfs.c b/drivers/net/bonding/bond_procfs.c
>index 2acf0b0..ad284ba 100644
>--- a/drivers/net/bonding/bond_procfs.c
>+++ b/drivers/net/bonding/bond_procfs.c
>@@ -158,12 +158,12 @@ static void bond_info_show_slave(struct seq_file *seq,
> 	seq_printf(seq, "\nSlave Interface: %s\n", slave->dev->name);
> 	seq_printf(seq, "MII Status: %s\n",
> 		   (slave->link = BOND_LINK_UP) ?  "up" : "down");
>-	if (slave->speed = -1)
>+	if (slave->speed = SPEED_UNKNOWN)
> 		seq_printf(seq, "Speed: %s\n", "Unknown");
> 	else
> 		seq_printf(seq, "Speed: %d Mbps\n", slave->speed);

	Since you #define SPEED_UNKNOWN to -1 (below), how does this
actually change anything?  Did you mean 0xffff (because struct
ethtool_cmd's speed is a u16)?

	Running on a moderately recent net-next (without the very recent
change to bond_update_speed_duplex), I see that bonding indeed doesn't
get the speed or duplex correct after a cable pull:

Slave Interface: eth2
MII Status: down
Speed: 100 Mbps
Duplex: full

	so perhaps a rational (unsigned-friendly) SPEED_UNKNOWN and
DUPLEX_UNKNOWN are needed, but I'm not sure how this #define actually
would change any behavior in the bonding case.

>-	if (slave->duplex = -1)
>+	if (slave->duplex = DUPLEX_UNKNOWN)
> 		seq_printf(seq, "Duplex: %s\n", "Unknown");
> 	else
> 		seq_printf(seq, "Duplex: %s\n", slave->duplex ? "full" : "half");

	This one might "work," but it seems to depend on the fact that
the integral conversion of -1 to an 8 bit unsigned type will be 255
(0xff).  I believe that's true (according to the ISO C copy I have
handy), but I'm not sure that kind of implicit assumption should be
built into the code.  At least not without some explanation.

	-J

>diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
>index 45f00b6..de33de1 100644
>--- a/include/linux/ethtool.h
>+++ b/include/linux/ethtool.h
>@@ -1097,10 +1097,12 @@ struct ethtool_ops {
> #define SPEED_1000		1000
> #define SPEED_2500		2500
> #define SPEED_10000		10000
>+#define SPEED_UNKNOWN		-1
>
> /* Duplex, half or full. */
> #define DUPLEX_HALF		0x00
> #define DUPLEX_FULL		0x01
>+#define DUPLEX_UNKNOWN		0xff
>
> /* Which connector port. */
> #define PORT_TP			0x00

---
	-Jay Vosburgh, IBM Linux Technology Center, fubar@us.ibm.com

