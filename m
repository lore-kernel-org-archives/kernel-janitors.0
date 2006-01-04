From: Greg KH <greg@kroah.com>
Date: Wed, 04 Jan 2006 01:13:08 +0000
Subject: Re: [KJ] adding missing MODULE_* stuffs
Message-Id: <20060104011306.GA19733@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69645275444655308=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051230000400.GS18040@outflux.net>
In-Reply-To: <20051230000400.GS18040@outflux.net>
To: kernel-janitors@vger.kernel.org

--===============69645275444655308==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 29, 2005 at 04:04:00PM -0800, Kees Cook wrote:
> Would patches towards adding missing MODULE_DESCRIPTION, MODULE_VERSION, 
> and MODULE_AUTHOR stuff be taken?  While these aren't covered in the 
> CodingStyle document, I did find reference to their preferred order in 
> Documentation/i2c/porting-clients.txt where Greg KH said the order 
> should be:

I said that?  Hm, looks like Jean did, not I :)

> 
> MODULE_AUTHOR
> MODULE_DESCRIPTION
> MODULE_LICENSE /* last line of source */
> 
> I'm curious where MODULE_VERSION should go, as well as 
> MODULE_PARAM_DESC.

Where ever you want them to go.  Traditionally the _DESC stuff goes
right after the module_param() line, to keep it all together.

> Notably, AUTHOR, DESCRIPTION, and VERSION seem to be missing from the 
> various examples in Documention/

What examples?

thanks,

greg k-h

--===============69645275444655308==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69645275444655308==--
