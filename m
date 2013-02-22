From: Michal Marek <mmarek@suse.cz>
Date: Fri, 22 Feb 2013 10:44:31 +0000
Subject: Re: [PATCH] scripts/coccinelle: find constant additions that could be bit ors
Message-Id: <20130222104431.GF12402@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1359821995-27910-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1359821995-27910-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Sat, Feb 02, 2013 at 05:19:55PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Semantic patch (http://coccinelle.lip6.fr/) to check for constants that are
> added but are used elsewhere as bitmasks.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to kbuild.git#misc.

Michal
