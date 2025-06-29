package com.example;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.mockito.Mockito.*;

public class MyServiceTest {

    @Test
    public void testVerifyInteraction() {
        // Create mock
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        // Call service
        MyService service = new MyService(mockApi);
        service.fetchData();

        // Verify interaction
        verify(mockApi).getData();
    }
}
