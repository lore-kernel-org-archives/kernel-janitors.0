From: Thomas Petazzoni <thomas.petazzoni@enix.org>
Date: Thu, 13 Sep 2007 15:11:27 +0000
Subject: Re: [PATCH][RFC] Drop the "static __initdata" from tmp_cmdline in
Message-Id: <46E9531F.4060808@enix.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0709131043070.4208@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0709131043070.4208@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Robert P. J. Day wrote:

> --- a/init/main.c
> +++ b/init/main.c
> @@ -482,7 +482,7 @@ static int __init do_early_param(char *param, char *val)
>  void __init parse_early_param(void)
>  {
>  	static __initdata int done = 0;
> -	static __initdata char tmp_cmdline[COMMAND_LINE_SIZE];
> +	char tmp_cmdline[COMMAND_LINE_SIZE];

As I've said in an answer to an e-mail from you on the kernelnewbies 
mailing list, this change is going to allocate 2k on the stack, which is 
quite big compared to the overall stack size. If you use 8k stacks, it 
may still work, but with 4k stacks, it eats half of the stack, leaving 
only 2k for the rest of the code to execute, which may not be enough. I 
think that why this buffer is static.

Sincerly,

Thomas
-- 
PETAZZONI Thomas - thomas.petazzoni@enix.org
http://thomas.enix.org - Jabber: thomas.petazzoni@jabber.dk
KOS: http://kos.enix.org/ - SOS: http://sos.enix.org
Fingerprint : 0BE1 4CF3 CEA4 AC9D CC6E  1624 F653 CB30 98D3 F7A7
