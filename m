From: Daniel Borkmann <dborkman@redhat.com>
Date: Wed, 10 Dec 2014 23:48:38 +0000
Subject: Re: [PATCH] scripts: coccinelle: add uses of memzero_explicit
Message-Id: <5488DBD6.7010704@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1418242123-8610-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1418242123-8610-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/10/2014 10:43 PM, SF Markus Elfring wrote:
>> Memzero_explicit is a version of memset that is resistent to compiler
>> optimizations when the set region is about to go out of scope.
>
> Thanks for another interesting update suggestion.
>
>> This was suggested by Daniel Borkmann
>
> How do you think about to amend such a commit message here?
>
> Would it eventually be better to use a tag like "Suggested-by" there
> (instead of finishing this sentence with a full stop)?

It might be better in future, but it's not a big deal.
