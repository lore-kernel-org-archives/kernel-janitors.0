From: Michal Marek <mmarek@suse.cz>
Date: Sat, 14 Jan 2012 21:45:05 +0000
Subject: Re: [PATCH 1/2] scripts/coccinelle: semantic patches related to devm_ functions
Message-Id: <4F11F761.70406@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1325004092-28162-1-git-send-email-julia.lawall@lip6.fr>
In-Reply-To: <1325004092-28162-1-git-send-email-julia.lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org

On 27.12.2011 17:41, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> devm_ functions allocate memory that is to remain allocated until the
> device is detached.  This patch checks for opportunities for using the
> function devm_request_and_ioremap.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied both patches to kbuild.git#misc. BTW, Please use different
subject lines for different patches next time, so that patches can be
referred to by their subject. I changed these two to "coccinelle:
semantic patches related to devm_ functions (part 1)" and "... (part 2)"
due to lack of better ideas.

Michal
