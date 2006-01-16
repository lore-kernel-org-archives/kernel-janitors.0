From: Christophe Lucas <clucas@altern.org>
Date: Mon, 16 Jan 2006 18:33:58 +0000
Subject: Re: [KJ] Audit return codes (and handle failure correctly)
Message-Id: <43CBE716.3060505@altern.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9a09df00601150731g4d65ab40ya62134fbd0a8cb22@mail.gmail.com>
In-Reply-To: <d9a09df00601150731g4d65ab40ya62134fbd0a8cb22@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Alexey Dobriyan a =E9crit :

>On Sun, Jan 15, 2006 at 05:31:05PM +0200, Udayan Singh wrote:
> =20
>
>>I am trying to understand a point mentioned in ToDo list of KJ,
>>
>>"Audit return codes (and handle failure correctly) for  " -- create_proc_=
*()
>>..
>>
>>I had a look at the code (in fs/proc/*, linux kernel 2.6.14).
>>
>>Clarifications that i needed :
>>
>>Is it that the wherever create_proc_* functions are being called, it needs
>>to be looked into how is it handling a failure ?
>>OR
>>Within the function(s) create_proc_*, it needs to be looked into for the
>>error codes it is receiving while it is calling other functions and handle
>>them accordingly ?
>>   =20
>>
>
>The former. If function can fail its return code should be checked,
>except very rare cases where you can't do anything better than panic().
>
> =20
>
>>I intend to understand the above mentioned requirement and then try to do
>>it. Would appreciate information on above.
>>   =20
>>
>
>Be sure to grab latest kernel (2.6.16-rc1 should be out pretty soon) and
>look at latest -kj for things already done.
> =20
>
Hi all,

I think you could search on :
    http://coderock.org/kj/2.6.13-rc1-kj/split/
and :
   =20
http://coderock.org/kj/2.6.13-rc1-kj/split/return_code-drivers_net_tokenrin=
g_olympic
could be a good start...

Have a nice day,
=20

			 - Christophe (clucas@altern.org) [At home]

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
