From: walter harms <wharms@bfs.de>
Date: Sat, 06 Oct 2007 16:32:45 +0000
Subject: Re: [PATCH][RFC] Drop the "static __initdata" from tmp_cmdline in
Message-Id: <4707B8AD.8040300@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0709131043070.4208@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0709131043070.4208@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


would a kalloc/free be suffizient ? some could do it like strdup().

re,
 wh


Thomas Petazzoni wrote:
> Hi,
> 
> Robert P. J. Day wrote:
> 
>> --- a/init/main.c
>> +++ b/init/main.c
>> @@ -482,7 +482,7 @@ static int __init do_early_param(char *param, char
>> *val)
>>  void __init parse_early_param(void)
>>  {
>>      static __initdata int done = 0;
>> -    static __initdata char tmp_cmdline[COMMAND_LINE_SIZE];
>> +    char tmp_cmdline[COMMAND_LINE_SIZE];
> 
> As I've said in an answer to an e-mail from you on the kernelnewbies
> mailing list, this change is going to allocate 2k on the stack, which is
> quite big compared to the overall stack size. If you use 8k stacks, it
> may still work, but with 4k stacks, it eats half of the stack, leaving
> only 2k for the rest of the code to execute, which may not be enough. I
> think that why this buffer is static.
> 
> Sincerly,
> 
> Thomas
