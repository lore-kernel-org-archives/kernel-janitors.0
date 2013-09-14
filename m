From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 14 Sep 2013 06:11:05 +0000
Subject: Re: [patch] staging: line6: add bounds check in snd_toneport_source_put()
Message-Id: <CAJSP0QWB2jvRZccC=_nNrPbutSKv_a80J03K5WLGf8iWA1P13g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130913080713.GI19211@elgon.mountain>
In-Reply-To: <20130913080713.GI19211@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Sep 13, 2013 at 10:07 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> "source" comes from the user in snd_ctl_elem_write() so it needs to be
> checked.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
