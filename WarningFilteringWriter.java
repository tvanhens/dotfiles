package raxod502.dotfiles;

import java.io.IOException;
import java.io.Writer;

public class WarningFilteringWriter extends Writer {

    private final Writer err;
    private final StringBuilder sb = new StringBuilder();

    public WarningFilteringWriter(Writer err) {
        this.err = err;
    }

    private void flushToErr(int untilIndex) throws IOException {
        err.write(sb.substring(0, untilIndex).replaceAll("WARNING: .+? already refers to: #'clojure.core/(?:prefers) in namespace: .+?, being replaced by: #'.+\n", ""));
        err.flush();
        sb.delete(0, untilIndex);
    }

    @Override
    public void write(char[] cbuf, int off, int len) throws IOException {
        sb.append(cbuf, off, len);
        int untilIndex = sb.lastIndexOf("\n");
        if (untilIndex != -1) {
            flushToErr(untilIndex + 1);
        }
    }

    @Override
    public void flush() throws IOException {
        flushToErr(sb.length());
    }

    @Override
    public void close() throws IOException {
        flush();
        err.close();
    }

}
