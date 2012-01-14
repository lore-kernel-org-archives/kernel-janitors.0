From: Michal Marek <mmarek@suse.cz>
Date: Sat, 14 Jan 2012 23:07:03 +0000
Subject: Re: [PATCH v2] scripts/coccinelle: improve the coverage of some semantic patches
Message-Id: <4F120A97.6050209@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326580914-20464-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1326580914-20464-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, Artem@mgw2.diku.dk, Bityutskiy@suse.de

On 14.1.2012 23:41, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> This patch ensures that all semantic patches in the scripts/coccinelle
> directory provide the report option.  Report messages that include line
> numbers now have the line number preceded by "line" for easier subsequent
> processing.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  scripts/coccinelle/api/kstrdup.cocci      |   75 ++++++++++++++++++++++++++++--
>  scripts/coccinelle/api/memdup.cocci       |   34 ++++++++++++-
>  scripts/coccinelle/api/memdup_user.cocci  |   39 ++++++++++++---
>  scripts/coccinelle/free/kfree.cocci       |   14 +++--
>  scripts/coccinelle/iterators/fen.cocci    |   73 ++++++++++++++++++++++++++---
>  scripts/coccinelle/iterators/itnull.cocci |   54 ++++++++++++++++++---
>  scripts/coccinelle/locks/call_kern.cocci  |   67 +++++++++++++++++++-------
>  scripts/coccinelle/locks/flags.cocci      |   12 ++--
>  scripts/coccinelle/locks/mini_lock.cocci  |   15 +++---
>  scripts/coccinelle/misc/doubleinit.cocci  |    8 +--
>  scripts/coccinelle/null/eno.cocci         |   36 ++++++++++++--
>  11 files changed, 351 insertions(+), 76 deletions(-)

This looks much better, thanks. Applied to kbuild.git#misc.

Michal
