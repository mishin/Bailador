use v6.c;

use Log::Any::Formatter;
use Terminal::ANSIColor;

class Bailador::LogFormatter is Log::Any::Formatter {

    submethod BUILD(
        :$!colorize,
        :$format,
        :$!log-any-formatter = Log::Any::FormatterBuiltIN.new(:format($format))
    ) {}
    # todo build to set format to log-any-formatter
    has $.log-any-formatter;
    has $.colorize;
    method format(|param) {
        my $str   = $.log-any-formatter.format(|param);
        my $color = param<extra-fields><color>;
        dd param;
        return $color ?? colored($str, $color) !! $str;
    }
}
