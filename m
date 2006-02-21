From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 21 Feb 2006 16:08:14 +0000
Subject: Re: [KJ][Patch] Alter prototypes in adm1026.c
Message-Id: <20060221160814.GH16220@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43051198421837911=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140182240.7789.44.camel@localhost.localdomain>
In-Reply-To: <1140182240.7789.44.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============43051198421837911==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 21.02.2006 [09:16:27 +0100], Jean Delvare wrote:
> 
> Hi Alexey,
> 
> On 2006-02-20, Alexey Dobriyan wrote:
> > > ICC complains about : Storage Class is not First
> > > @ line 301 & 302 of adm1026.c
> > >
> > > It appears that the variable in the prototype is named register which
> > > confuses ICC, it is called (more sensibly) reg in the actual functions.
> > > This is confusing (as register is a keyword)
> >
> > Applied. Standard more or less says, if pp-identifier can be converted to
> > identifier or keyword, it's converted to keyword. So, we have
> > "u8 [keyword]" oops...
> 
> Applied? To what, please? As the maintainer of the hwmon subsystem, I
> took these patches already.

I'm pretty sure he meant they were applied to the -kj tree. When Alexey
next merges against mainline, he'll see your patches have been pushed up
(hopefully) and it will resolve itself. Or he might drop them now, since
you've said you have merged them.

Thanks,
Nish

--===============43051198421837911==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43051198421837911==--
