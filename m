From: John Daiker <daikerjohn@gmail.com>
Date: Fri, 19 Aug 2011 19:53:19 +0000
Subject: Re: [PATCH 1/1] Sound, echoaudio: Place echoaudio drivers in submenu
Message-Id: <CAEUpBtpYKjC5QGc=HXQu8_TP0kHFofYNQ1PPzvWfMSDHt4nv4Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313687472-8267-1-git-send-email-daikerjohn@gmail.com>
In-Reply-To: <1313687472-8267-1-git-send-email-daikerjohn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, Aug 18, 2011 at 10:32 PM, Takashi Iwai <tiwai@suse.de> wrote:
> At Thu, 18 Aug 2011 10:11:12 -0700,
> John Daiker wrote:
>>
>> Put all the echoaudio boards into their own Kconfig submneu. =A0They use=
d to be
>> listed individually.
>
> Because they are indeed individual drivers :)

Individual like the Intel HD Audio drivers?  :-P  I was using that
section of Kconfig as a model.

Seems like there's a disconnect between the folder structure and the
config option(s).  All the files are in the echoaudio folder, but the
Kconfig shows them as individuals.  This is contrary to the Intel HD
Audio situation.  One folder, one (over-arching) Kconfig option.
Which is best?  Does it really matter?

>
> I don't mind much to include such a patch, but OTOH, people also don't
> like to add yet-another-config item. =A0Also default=3Dy isn't always
> preferred...

What would be preferred here?  The Intel HD Audio config doesn't show
a default... nor do any of the echoaudio drivers themselves.  Can I
omit the 'default' line completely?

John

>
>
> thanks,
>
> Takashi
>
>>
>> Signed-off-by: John Daiker <daikerjohn@gmail.com>
>> ---
>> =A0sound/pci/Kconfig | =A0 25 +++++++++++++++++++++++++
>> =A01 files changed, 25 insertions(+), 0 deletions(-)
>>
>> diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
>> index 8816804..9344274 100644
>> --- a/sound/pci/Kconfig
>> +++ b/sound/pci/Kconfig
>> @@ -312,8 +312,18 @@ config SND_CTXFI
>> =A0 =A0 =A0 =A0 To compile this driver as a module, choose M here: the m=
odule
>> =A0 =A0 =A0 =A0 will be called snd-ctxfi.
>>
>> +config SND_ECHOAUDIO
>> + =A0 =A0 tristate "Echoaudio Support"
>> + =A0 =A0 default y
>> + =A0 =A0 select SND_PCM
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Support for EchoAudio based devices.
>> +
>> +if SND_ECHOAUDIO
>> +
>> =A0config SND_DARLA20
>> =A0 =A0 =A0 tristate "(Echoaudio) Darla20"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_PCM
>> =A0 =A0 =A0 help
>> @@ -324,6 +334,7 @@ config SND_DARLA20
>>
>> =A0config SND_GINA20
>> =A0 =A0 =A0 tristate "(Echoaudio) Gina20"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_PCM
>> =A0 =A0 =A0 help
>> @@ -334,6 +345,7 @@ config SND_GINA20
>>
>> =A0config SND_LAYLA20
>> =A0 =A0 =A0 tristate "(Echoaudio) Layla20"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_RAWMIDI
>> =A0 =A0 =A0 select SND_PCM
>> @@ -345,6 +357,7 @@ config SND_LAYLA20
>>
>> =A0config SND_DARLA24
>> =A0 =A0 =A0 tristate "(Echoaudio) Darla24"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_PCM
>> =A0 =A0 =A0 help
>> @@ -355,6 +368,7 @@ config SND_DARLA24
>>
>> =A0config SND_GINA24
>> =A0 =A0 =A0 tristate "(Echoaudio) Gina24"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_PCM
>> =A0 =A0 =A0 help
>> @@ -365,6 +379,7 @@ config SND_GINA24
>>
>> =A0config SND_LAYLA24
>> =A0 =A0 =A0 tristate "(Echoaudio) Layla24"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_RAWMIDI
>> =A0 =A0 =A0 select SND_PCM
>> @@ -376,6 +391,7 @@ config SND_LAYLA24
>>
>> =A0config SND_MONA
>> =A0 =A0 =A0 tristate "(Echoaudio) Mona"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_RAWMIDI
>> =A0 =A0 =A0 select SND_PCM
>> @@ -387,6 +403,7 @@ config SND_MONA
>>
>> =A0config SND_MIA
>> =A0 =A0 =A0 tristate "(Echoaudio) Mia"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_RAWMIDI
>> =A0 =A0 =A0 select SND_PCM
>> @@ -398,6 +415,7 @@ config SND_MIA
>>
>> =A0config SND_ECHO3G
>> =A0 =A0 =A0 tristate "(Echoaudio) 3G cards"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_RAWMIDI
>> =A0 =A0 =A0 select SND_PCM
>> @@ -409,6 +427,7 @@ config SND_ECHO3G
>>
>> =A0config SND_INDIGO
>> =A0 =A0 =A0 tristate "(Echoaudio) Indigo"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_PCM
>> =A0 =A0 =A0 help
>> @@ -419,6 +438,7 @@ config SND_INDIGO
>>
>> =A0config SND_INDIGOIO
>> =A0 =A0 =A0 tristate "(Echoaudio) Indigo IO"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_PCM
>> =A0 =A0 =A0 help
>> @@ -429,6 +449,7 @@ config SND_INDIGOIO
>>
>> =A0config SND_INDIGODJ
>> =A0 =A0 =A0 tristate "(Echoaudio) Indigo DJ"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_PCM
>> =A0 =A0 =A0 help
>> @@ -439,6 +460,7 @@ config SND_INDIGODJ
>>
>> =A0config SND_INDIGOIOX
>> =A0 =A0 =A0 tristate "(Echoaudio) Indigo IOx"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_PCM
>> =A0 =A0 =A0 help
>> @@ -449,6 +471,7 @@ config SND_INDIGOIOX
>>
>> =A0config SND_INDIGODJX
>> =A0 =A0 =A0 tristate "(Echoaudio) Indigo DJx"
>> + =A0 =A0 depends on SND_ECHOAUDIO
>> =A0 =A0 =A0 select FW_LOADER
>> =A0 =A0 =A0 select SND_PCM
>> =A0 =A0 =A0 help
>> @@ -457,6 +480,8 @@ config SND_INDIGODJX
>> =A0 =A0 =A0 =A0 To compile this driver as a module, choose M here: the m=
odule
>> =A0 =A0 =A0 =A0 will be called snd-indigodjx
>>
>> +endif
>> +
>> =A0config SND_EMU10K1
>> =A0 =A0 =A0 tristate "Emu10k1 (SB Live!, Audigy, E-mu APS)"
>> =A0 =A0 =A0 select FW_LOADER
>> --
>> 1.7.4.1
>>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
