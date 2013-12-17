From: Amir Vadai <amirv@mellanox.com>
Date: Tue, 17 Dec 2013 12:55:08 +0000
Subject: Re: mlx4_en: Using blue flame support
Message-Id: <52B049AC.50008@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131217115730.GA10787@elgon.mountain>
In-Reply-To: <20131217115730.GA10787@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 17/12/2013 13:57, Dan Carpenter wrote:
>    838          if (ring->bf_enabled && desc_size <= MAX_BF && !bounce && !vlan_tx_tag_present(skb)) {
>    839                  *(__be32 *) (&tx_desc->ctrl.vlan_tag) |= cpu_to_be32(ring->doorbell_qpn);
> 
> And then sometimes we overwrite them here.  It's not clear if this is
> deliberate or accidental.  Maybe add a comment?

Yes, this is deliberate.
I will send a patch to make it clearer.

Amir
