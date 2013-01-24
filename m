From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Thu, 24 Jan 2013 10:51:03 +0000
Subject: Re: [patch v2] usb: gadget: precedence bug in show_requests()
Message-Id: <87fw1qonvs.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120172722.GA11248@elgon.mountain>
In-Reply-To: <20130120172722.GA11248@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The intent here was to have parenthesis around the (ci->hw_ep_max / 2)
> so that it counts like "0 1 2 0 1 2".  In the current code, the mod
> operation happens first so it counts like "0 0 1 1 2 2".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, I added this one on top of my debug cleanup patchset [1].

[1] http://marc.info/?l=linux-usb&m5902438408860&w=2

Regards,
--
Alex
