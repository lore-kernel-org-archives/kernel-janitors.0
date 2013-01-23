From: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 23 Jan 2013 14:42:17 +0000
Subject: Re: [PATCH 11/15] tools/lib/traceevent/event-parse.c: adjust duplicate test
Message-Id: <1358952137.21576.117.camel@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1358773378-4700-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358773378-4700-12-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@infradead.org>, Namhyung Kim <namhyung@kernel.org>

On Mon, 2013-01-21 at 14:02 +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Delete successive tests to the same location.  Field was already tested.
> Alloc_arg can fail, so test that value instead.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @s exists@
> local idexpression y;
> expression x,e;
> @@
> 
> *if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
>  { ... when forall
>    return ...; }
> ... when != \(y = e\|y += e\|y -= e\|y |= e\|y &= e\|y++\|y--\|&y\)
>     when != \(XT_GETPAGE(...,y)\|WMI_CMD_BUF(...)\)
> *if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
>  { ... when forall
>    return ...; }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

> ---
>  tools/lib/traceevent/event-parse.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/lib/traceevent/event-parse.c b/tools/lib/traceevent/event-parse.c
> index 5a824e3..7538a1f 100644
> --- a/tools/lib/traceevent/event-parse.c
> +++ b/tools/lib/traceevent/event-parse.c
> @@ -2481,7 +2481,7 @@ process_dynamic_array(struct event_format *event, struct print_arg *arg, char **
>  
>  	free_token(token);
>  	arg = alloc_arg();
> -	if (!field) {
> +	if (!arg) {
>  		do_warning("%s: not enough memory!", __func__);
>  		*tok = NULL;
>  		return EVENT_ERROR;
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/


