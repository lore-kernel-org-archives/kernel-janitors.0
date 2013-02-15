From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Feb 2013 11:46:52 +0000
Subject: Re: Kernel janitors website?
Message-Id: <20130215114652.GE6853@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87d2w2u5qv.fsf@steelpick.2x.cz>
In-Reply-To: <87d2w2u5qv.fsf@steelpick.2x.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 15, 2013 at 10:39:55AM +0000, Anuz Pratap Singh Tomar wrote:
> On Fri, Feb 15, 2013 at 10:14 AM, Dan Carpenter <dan.carpenter@oracle.com>wrote:
> 
> > On Fri, Feb 15, 2013 at 10:24:09AM +0100, Julia Lawall wrote:
> > > > Everything in staging/ is supposed to be being developed with the
> > > > goal of getting out.  The exception would the android code.
> > >
> > > OK, at one point, some code was put there that was on the way out, unless
> > > someone complained, rather than on the way in.  I think it was around the
> > > time of the final elimination of the big kernel lock.  But perhaps it was
> > > an isolated incident.  If all of the code in staging is actually of
> > > interest, maybe I should pay more attention to it in the future :)
> >
> > Oh, yes.  Telephony, serial/ and tty/ were that way.  They have been
> > deleted now.
> >
> > I think the only driver on its way out now is the one under net/.
> >
> > Is there a way to find out what all bugs exists for staging? I did search
> on bugzilla.kernel.org for keyword "staging" but the bug list seemed to be
> bit outdated or bugs fixed etc. Any other place to look for staging bugs?

Run smatch against drivers/staging/csr:

for i in $(find drivers/staging/csr -name \*.c) ; do
	~/path/to/smatch/smatch_scripts/kchecker --spammy $i
done

No error handling for kmalloc()
Locking bugs in uf_check_inactivity()
drivers/staging/csr/unifi_sme.c:884 unifi_cfg_get_info()
	warn: check that 'cfg_ap_config.shortSlotTimeEnabled'
	doesn't leak information
drivers/staging/csr/netdev.c:1989 indicate_rx_skb() warn: variable
	dereferenced before check 'dev' (see line 1979)
drivers/staging/csr/unifi_pdu_processing.c:2707
	uf_handle_uspframes_delivery() warn: was && intended here
	instead of ||?
drivers/staging/csr/csr_wifi_hip_card_sdio.c:2411
	unifi_identify_hw() error: we previously assumed
	'card->helper' could be null (see line 2404)

regards,
dan carpenter

