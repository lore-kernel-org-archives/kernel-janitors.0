From: Domen Puncer <domen@coderock.org>
Date: Sat, 15 Jan 2005 12:18:17 +0000
Subject: [KJ] Re: accessing user mode register
Message-Id: <20050115121817.GA3760@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25702848365459596=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25702848365459596==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15/01/05 11:07 -0000, surendra singh  bisht wrote:
>   
> 
>   how do i access user mode register from kernel space
>   i m trying to write a system call where i need to access the register 
>   pushed in stack during system call

(Wrong list, you might want to try at kernel-newbies.)

struct pt_regs is passed to syscall, so just use it (see
sys_clone for example).


	Domen

--===============25702848365459596==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25702848365459596==--
