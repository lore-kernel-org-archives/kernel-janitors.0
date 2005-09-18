From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 18 Sep 2005 12:03:42 +0000
Subject: Re: [KJ] Holding off patches 6 - 20 for a bit
Message-Id: <20050918120342.GA24412@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80901172566961499=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <E80C9DA8-1015-42E3-8B4F-7A9D140B36D2@gmail.com>
In-Reply-To: <E80C9DA8-1015-42E3-8B4F-7A9D140B36D2@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============80901172566961499==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 17, 2005 at 07:27:16PM -0700, Jesse Millan wrote:
> I'll wait to see if there is any feedback before sending the rest.

a) If you're stuck with sending patches as attachments, please, include
   full changelog in attachment too.
b) Separate #define for, say, license doesn't make sense, because it'll
   be used only in one place.
c) One patch per directory would be nice. I'll collapse them anyway.


--===============80901172566961499==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80901172566961499==--
