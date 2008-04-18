From: Julia Lawall <julia@diku.dk>
Date: Fri, 18 Apr 2008 19:36:55 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <Pine.LNX.4.64.0804182132190.28810@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Does the initialization of result in the following code serve any purpose?

sound/isa/sb/sb_common.c:

 static int snd_sbdsp_version(struct snd_sb * chip)
 {
        unsigned int result = -ENODEV;

        snd_sbdsp_command(chip, SB_DSP_GET_VERSION);
        result = (short) snd_sbdsp_get_byte(chip) << 8;

If result is unsigned, its value will never be -ENODEV, and anyway the 
value is overwritten before it is ever used.

There are a couple of other cases like this.  There are also 
initializations of unsigned variables to -1, which seem prevalent 
enough that perhaps they serve some purpose.

julia

