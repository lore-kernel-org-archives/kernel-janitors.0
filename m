From: Zach Brown <zab@zabbo.net>
Date: Tue, 08 Jun 2004 15:49:23 +0000
Subject: Re: [Kernel-janitors] [PATCH] linux-2.6.7-rc2/fs/cifs/cifsf
Message-Id: <40C5E003.1090100@zabbo.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87585280865376081=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0406060258100.19187@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0406060258100.19187@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============87585280865376081==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

 (Walter Harms) wrote:
> hi zach,
> i have rewritten the ini already. what do you mean nop cifs_proc_clean?
> somelike that ?

Something like that, yeah..

#ifdef CONFIG_PROC_FS
void cifs_proc_clean(void); /* usual prototype */
#else
#define cifs_proc_clean() do { } while (0)
#endif

This might not make sense if cifs_proc_clean() is in the same file.  I'm
not actually looking at the code, or anything :)

The thing to take away is that the #ifdef garbage should be dealt with
by the function and it's prototype in the headers, not by callers.

--===============87585280865376081==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87585280865376081==--
