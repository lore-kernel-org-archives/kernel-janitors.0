From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2011 08:14:12 +0000
Subject: Re: [patch] Staging: cx25821: off by on in cx25821_vidioc_s_input()
Message-Id: <20111012081412.GE18470@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132643.GB31424@elgon.mountain>
 <4E94AE2D.4050408@redhat.com>
In-Reply-To: <4E94AE2D.4050408@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, "Leonid V. Fedorenchik" <leonidsbox@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, devel@driverdev.osuosl.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 11, 2011 at 05:59:25PM -0300, Mauro Carvalho Chehab wrote:
> > -	if (i > 2) {
> > +	if (i >= 2) {
> 
> It would be better to add a NUM_INPUT macro (or something like that, defined together
> with the INPUT macro) that would do an ARRAY_SIZE(cx25821_boards) and use it here, 
> instead of a "2" magic number.

You're right.  The hard coded 2 is not helpful...  Why not just an:

	if (i >= ARRAY_SIZE(cx25821_boards)) {...

I'll send a patch to do that.

regards,
dan carpenter
