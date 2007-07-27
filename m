From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 10:18:46 +0000
Subject: Re: [PATCH 06/68] 0 -> NULL, for arch/frv
Message-Id: <87lkd29mk9.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17167@ifs.emn.fr> <22618.1185531297@redhat.com>
In-Reply-To: <22618.1185531297@redhat.com> (David Howells's message of "Fri,
	27 Jul 2007 11:14:57 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

David Howells <dhowells@redhat.com> writes:

> Yoann Padioleau <padator@wanadoo.fr> wrote:
>
>> When comparing a pointer, it's clearer to compare it to NULL than to 0.
>
> Can you make them of style:
>
> 	if (!x)

Yes I can. I can make another semantic patch later to do that
transformation. But some people may prefer (x = NULL) to (!x)
so I don't know. I think that transformation 
some 0 to NULL is less controversial.


>
> instead?
>
> Thanks,
> David

