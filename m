From: Matt Leininger <mlleinin@hpcn.ca.sandia.gov>
Date: Fri, 21 Jan 2005 17:24:09 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <1106328249.2787.1457.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============021728006137557543=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============021728006137557543==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2005-01-20 at 10:21 -0800, Greg KH wrote:
> On Thu, Jan 20, 2005 at 10:02:24AM -0800, Sean Hefty wrote:
> > Greg KH wrote:
> > 
> > >Personally, I think it's a stupid thing to try to license this code in a
> > >dual way, as any port someone is going to have to do to get this code to
> > >work in another os will be almost a complete rewrite in the end
> > >anyway...
> > 
> > I think that companies want to be able to make derivative works without 
> > needing to make the derivative open source, versus porting it to 
> > another OS.
> 
> And then run that derivitave work on a Linux GPL kernel?  Hah, good luck
> with your lawyers if you try to do that.  And good luck trying to work
> around symbols that the openib code is using that are marked
> EXPORT_SYMBOL_GPL().
> 
> Why do people try to do such stupid things, haven't the IB members
> learned from the past...
> 
> Remind me to _never_ send in an openib kernel patch if this is the
> reason why the license is what it is.
> 
  The idea was for folks to be able to take the OpenIB code, under BSD,
and port it to OSes other than Linux.  I agree that having a BSD only
stack running on Linux would be silly and should be avoided.  In the end
I only care about Linux.  I think performance should drive what Linux
features OpenIB uses.  If it improves performance then it's worth
using.  

   - Matt


--===============021728006137557543==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============021728006137557543==--
