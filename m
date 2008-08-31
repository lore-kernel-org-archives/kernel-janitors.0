From: walter harms <wharms@bfs.de>
Date: Sun, 31 Aug 2008 18:15:38 +0000
Subject: Re: [PATCH] Fix build warning in kernel/auditsc.c
Message-Id: <48BADFCA.3090206@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <48b93353.02e2660a.0e28.3e54@mx.google.com>
In-Reply-To: <48b93353.02e2660a.0e28.3e54@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Hannes Eder schrieb:
> Fix the following build warning, by eliminating the variable.
> 
> kernel/auditsc.c: In function 'audit_match_perm':
> kernel/auditsc.c:249: warning: ISO C90 forbids mixed declarations and code
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> walter harms <wharms@bfs.de> wrote:
>> maybe you can do a s/n/ctx->major/g ?
>> removing the need for the whole variable ?!
> 
> Here we go.  Why is this better than splitting the variable declaration and
> initialization, as in the previous patch?
> 

Hi hannes,
removing the variable removes the problem for ever. The Variable itself is used as
"shortcut" to ctx->major whar is useful in larger codes to get a better overview (sometimes).
In this case the code is short, so there is no advantage in keeping.

re,
  wh



