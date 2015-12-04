From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Dec 2015 12:53:01 +0000
Subject: Re: [patch] Smack: harmless underflow in smk_set_cipso()
Message-Id: <20151204124956.GY18797@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151103221539.GC19280@mwanda>
In-Reply-To: <20151103221539.GC19280@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Dec 03, 2015 at 02:23:22PM -0800, Casey Schaufler wrote:
> On 11/3/2015 2:15 PM, Dan Carpenter wrote:
> >Also checkpatch complains that we should use kstrtouint() instead of
> >sscanf here.
> >
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> This no longer parses cipso specifications correctly.
> I haven't investigated why. It looks as if it should
> work. Does kstrtouint() allow for leading whitespace?

No it doesn't.  I feel slightly betrayed because checkpatch.pl told me
to introduce that bug.  I have said so many times that I think
checkpatch.pl should not tell people to introduce bugs...

regards,
dan carpenter

