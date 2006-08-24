From: "Raseel Bhagat" <raseelbhagat@gmail.com>
Date: Thu, 24 Aug 2006 04:38:48 +0000
Subject: Re: [KJ] [PATCH] all files: init, cleanup to module init/exit
Message-Id: <f68850780608232126y77db89ceq56e9fdf0da47a86a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
In-Reply-To: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On 8/24/06, Frederik Deweerdt <deweerdt@free.fr> wrote:
> Yes there are, but if you're using module_init, the compiler will do
> the right thing:
> - if MODULE is defined, the function will be called at load time
> - if not, do_initcalls will call the init function at boot time

Exactly, which is why I asked why is it such a big sin to have the ifdefs ?
And plus, I don't think they are added by the OP,  his patch was not
concerning that.... or did I miss somthing ?

-- 
Raseel.
http://osd.byethost8.com
http://raseel.livejournal.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
