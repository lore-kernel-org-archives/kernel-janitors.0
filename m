From: Alasdair G Kergon <agk@redhat.com>
Date: Wed, 02 Jul 2008 10:54:34 +0000
Subject: Re: [dm-devel] [PATCH 2/6] drivers/md: remove null pointer dereference
Message-Id: <20080702105434.GF22522@agk.fab.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805121537100.3694@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0805121537100.3694@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: device-mapper development <dm-devel@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 12, 2008 at 03:37:31PM +0200, Julia Lawall wrote:
> If pgpath->pg->ps.type is NULL, it is not possible to access its name
> field.  So I have simply modified the error message to drop the printing of
> the name field.
> 
> This problem was found using the following semantic match
> (http://www.emn.fr/x-info/coccinelle/)
 
> --- a/drivers/md/dm-mpath.c	2008-04-16 13:27:57.000000000 +0200
> +++ b/drivers/md/dm-mpath.c	2008-05-12 09:19:35.000000000 +0200
> @@ -884,8 +884,7 @@ static int reinstate_path(struct pgpath 
>  		goto out;
>  
>  	if (!pgpath->pg->ps.type) {
> -		DMWARN("Reinstate path not supported by path selector %s",
> -		       pgpath->pg->ps.type->name);
> +		DMWARN("Reinstate path not supported by path selector");
>  		r = -EINVAL;
>  		goto out;
>  	}
 
Thanks for reporting this.

A more-sophisticated checker might discover that the test can never fail
- see parse_path_selector() - and so the real problem here is that it is
the wrong test.

The next line is:
	r = pgpath->pg->ps.type->reinstate_path(&pgpath->pg->ps, &pgpath->path);
and the error message makes it clear that the intent was to ensure that
the reinstate_path method exists before attempting to use it.

IOW
	if (!pgpath->pg->ps.type->reinstate_path) {

Alasdair
-- 
agk@redhat.com
