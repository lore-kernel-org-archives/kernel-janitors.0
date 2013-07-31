From: Kevin Curtis <Kevin.Curtis@farsite.com>
Date: Wed, 31 Jul 2013 13:55:50 +0000
Subject: RE: Updated FarSync driver
Message-Id: <E603DC592C92B54A89CEF6B0919A0B1CA88EBB0284@SOLO.hq.farsitecommunications.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
In-Reply-To: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,
    I am fixing the errors and warning reported by checkpatch.  I have quite a few of these:

ERROR: do not initialise globals to 0 or NULL
#90: FILE: drivers/net/wan/farsync.c:83:
+int fst_excluded_cards = 0;

Is this because when the module is loaded the globals are guaranteed to be zero'd already, or is the module init is expected to initialise them?


Regards

Kevin
