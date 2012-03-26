From: Michal Marek <mmarek@suse.cz>
Date: Mon, 26 Mar 2012 20:44:50 +0000
Subject: Re: [PATCH v2] scripts/coccinelle/api/ptr_ret.cocci: semantic patch for ptr_err
Message-Id: <20120326204450.GD10259@sepie.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1332699179-18934-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1332699179-18934-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, imirkin@alum.mit.edu, kernel-janitors@vger.kernel.org

On Sun, Mar 25, 2012 at 08:12:59PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> Fixed warning messages to refer to the right function.
> 
>  scripts/coccinelle/api/ptr_ret.cocci |   70 +++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)

Applied to kbuild.git#misc, thanks.

Michal
