From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Wed, 15 Dec 2004 21:45:31 +0000
Subject: Re: [KJ] Re: kernel-2.6.9: make sock_init() notice errors
Message-Id: <41C0B07B.50208@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041215160106.GA5321@nd47.coderock.org>
In-Reply-To: <20041215160106.GA5321@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen Puncer wrote:
> On 27/11/04 17:26 +0100, walter harms wrote:
> 
>>Hi list,
>>by accident i found that that sock_init never checks the return code of
>>called init functions. I have no idea why this is not done so i added
>>only a printk() to inform the user about the problem.
>>The function returns no error indicator. i left it this way.
> 
> 
> I don't like this patch: it doesn't really do anything useful...
> ie. if user runs out of memory on boot, he'll have other problems
> than caring about sock_init failing somewhere.
> 
> Comments?

Better have a message that gives a clue about where things went wrong
than nothing.

If a function is not to be checked against failure, convert it to
return void 8) IOW: always check non void returning functions.

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
