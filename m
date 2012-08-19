From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 19 Aug 2012 19:33:56 +0000
Subject: RE: [staging-next V3] ozwpan: fix memcmp() test in oz_set_active_pd()
Message-Id: <alpine.DEB.2.02.1208192133370.1924@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345394197-6561-1-git-send-email-tomas.winkler@intel.com>
In-Reply-To: <1345394197-6561-1-git-send-email-tomas.winkler@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 19 Aug 2012, Winkler, Tomas wrote:

>>
>> There seems also to be an opportunity in drivers/scsi/qla2xxx/qla_init.c:
>>
>> memcmp(icb->enode_mac, "\0\0\0\0\0\0", sizeof(icb->enode_mac))
>
> If you plan do semantic patch then there are also examples of:
>
> ./drivers/staging/rtl8712/rtl871x_recv.c:
> if (!memcmp(pattrib->bssid, "\x0\x0\x0\x0\x0\x0", ETH_ALEN) |
>
> similarly
> is_broadcast_ether_addr()  to replace memcmp  with 6 off 0xFF
>
> and endless number of memcmp that can be replaced with
> ether_addr_equal()

OK, thanks for the suggestions.  I will take a look.

julia
