From: Yoann Padioleau <padator@wanadoo.fr>
Date: Thu, 24 May 2007 15:21:52 +0000
Subject: [KJ] old style C declaration
Message-Id: <878xbeqmb3.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi, 

In drivers/net/atari_pamsnet.c many (not all) functions use an old style:

static HADDR
*read_hw_addr(target, buffer)
	int target;
	unsigned char *buffer;
{
	HADDR *ret = 0;
	unsigned char cmd_buffer[5];

	if (send_first(target, READSECTOR))
		goto bad;
	setup_dma(buffer, READ, 1);
	cmd_buffer[0] = cmd_buffer[1] = cmd_buffer[2] = cmd_buffer[4] = 0;
	cmd_buffer[3] = 1;
	if (send_1_5(5, cmd_buffer, 1) ||
	    !acsi_wait_for_IRQ(TIMEOUTDMA) ||
	    get_status())
		goto bad;
	ret = phys_to_virt((unsigned long)&(((DMAHWADDR *)buffer)->hwaddr));
	dma_cache_maintenance((unsigned long)buffer, 512, 0);
bad:
	return (ret);
}


Can I change them so that the file use a consistent style ? 

On the example this would lead to:

static HADDR
*read_hw_addr(int target, unsigned char * buffer)
{
...


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
