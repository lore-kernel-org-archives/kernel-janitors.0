From: Domen Puncer <domen@coderock.org>
Date: Sat, 19 Feb 2005 10:56:41 +0000
Subject: [KJ] Re: sound/oss/dmasound/dac3550.c:replace [const]char *s=""	by
Message-Id: <20050219105640.GA3834@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19675399614453393=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19675399614453393==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry for late reply.

On 04/02/05 11:39 +0000, Vicente Feito wrote:
> Hi,
> Please consider applying.
> Thank you.
> 
> Description: Replaces const char *s = "" with const char s[] = "".
> 
> Signed-off-by: Vicente Feito <vicente.feito@gmail.com>
> 
> --- linux-2.6.10-orig/sound/oss/dmasound/dac3550a.c     2005-02-04 02:09:10.000000000 +0000
> +++ linux-2.6.10/sound/oss/dmasound/dac3550a.c  2005-02-04 09:27:37.000000000 +0000
> @@ -162,7 +162,7 @@ static int daca_init_client(struct i2c_c
> 
>  static int daca_detect_client(struct i2c_adapter *adapter, int address)
>  {
> -       const char *client_name = "DAC 3550A Digital Equalizer";
> +       const char client_name[] = "DAC 3550A Digital Equalizer";

     ^^ spaces instead of tabs (copy pasted? most mailers allow you to
	     insert file inline, you should probably use that; you can
	     confirm it works by sending test patch to yourself and try
	     applying it)

Same goes for following three patches.

Oh, and I don't think oss is really worth patching as it is going away.
Well... it's your time -> your choice :-)


	Domen

--===============19675399614453393==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19675399614453393==--
